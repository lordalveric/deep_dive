=begin rdoc
=DeepDive Deep Contolled Cloning

When you have a system of objects that have many references to each other, it becomes an
issue to be able to clone properly that object graph. There may be control objects you may
not want to clone, but maintain references to. And some references you may not wish to clone at all.

Enter DeepDive. Allows you a means by which you can do controlled deep cloning or
copying of your complex interconnected objects.

=Usage
Simply include DeepDive in your base class. All classes derived will be set
for deep cloning or deep duping.
=end
require 'set'

module DeepDive
  class DeepDiveException < Exception
  end

  module API
    # #ddup is a Deep Dive's replacement for #dup.
    def ddup
      _replicate dupit: true
    end

    # #dclone is Deep Dive's replacement for #clone.
    def dclone
      _replicate dupit: false
    end
  end

  include API

  class ::Hash
    include API
  end

  class ::Array
    include API
  end

  # Not meant to be called externally. Use either ddup or dclone.
  def _replicate(dupit: true, oc: {})
    unless oc.member? self
      copy = oc[self] = if dupit
                          dup
                        else
                          clone
                        end
      copy.instance_variables.map do |var|
        [var, instance_variable_get(var)]
      end.reject do |var, ob|
        not ob.respond_to? :_replicate
      end.reject do |var, ob|
        self.class.excluded?(var, self)
      end.each do |var, value|
        copy.instance_variable_set(var, value._replicate(oc: oc, dupit: dupit))
      end
    end
    oc[self]
  end

  # For all enumerable objects, we will have to handle their situation
  # differently.
  module ::Enumerable
    # FIXME: clean up the code a bit, this could be better structured.
    def _ob_maybe_repl(v: nil, dupit: nil, oc: nil)
      if v.respond_to? :_replicate
        v._replicate(oc: oc, dupit: dupit)
      else
        v
      end
    end

    # add a single element to the enumerable.
    # You may pass a single parameter, or a key, value. In any case,
    # all will added.
    #
    # Here all the logic will be present to handle the "special case"
    # enumerables. Most notedly, Hash and Array will require special
    # treatment.
    def _add(v: nil, dupit: nil, oc: nil)
      unless _pairs?
        case
          when self.kind_of?(::Set)
          when self.kind_of?(::Array)
            self << _ob_maybe_repl(v: v, dupit: dupit, oc: oc)
          else
            raise DeepDiveException.new("Don't know how to add new elements for class #{self.class}")
        end
      else
        self[v.first] = _ob_maybe_repl(v: v.last, dupit: dupit, oc: oc)
      end
    end

    # We try to determine if this enumberable will return pairs
    # (as in the case of a Hash) or objects (which may look like pairs
    # but not really).
    def _pairs?
      self.kind_of? ::Hash
    end

    # Here, with this Enumerator, we want to create a new empty instance
    # and populate it with replicas (or references) of the contained
    # objects.
    #
    # here, a nasty problem is that there is no unified API for *adding*
    # or *substituting* objects into the new collection, so we are going
    # to abstract that issue to #_add.
    #
    # FIXME: We will initially not handle Enumberables that have instance variables.
    # FIXME: This issue will be addressed at a later date.
    def _replicate(dupit: true, oc: {})
      unless oc.member? self
        self.inject(oc[self] = self.class.new) do |copy, v|
          copy._add(v: v, dupit: dupit, oc: oc)
          copy
        end
      end
      oc[self]
    end
  end

  module CMeth
    @@exclusion = []
    # exclusion list of instance variables to dup/clone
    def exclude(*list, &block)
      @@exclusion << list.map { |s| "@#{s}".to_sym }
      @@exclusion.flatten!
      @@exclusion_block = block if block_given?
    end

    # Internal function not meant to be called by the application.
    def excluded?(sym, ob = nil)
      unless @@exclusion_block.nil?
        @@exclusion_block.(sym, ob)
      end || @@exclusion.member?(sym)
    end
  end

  def self.included(base)
    base.extend(CMeth)
  end

  def self.inherited(sub)
    sub.include(DeepDive)
  end
end
