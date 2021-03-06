module TaskWarrior
  module Attributes
  	module ClassMethods
		  def attributes(*attr)
		    if attr.nil? or attr.empty?
		      @attributes
		    else
		      @attributes = attr
		      @attributes.each{|attr| self.send('attr_accessor', attr)}
		    end
		  end
		end

		# http://blog.jayfields.com/2006/12/ruby-instance-and-class-methods-from.html
	  def self.included(base)
	    base.extend(ClassMethods)
	  end
  end
end