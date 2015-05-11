require 'rubygems'
%w[irb/completion pp].map &method(:require)

def IRB.std
  IRB::Irb.class_eval do
    def output_value
      p IRB.CurrentContext.last_value
    end
  end
end

def IRB.pp
  IRB::Irb.class_eval do
    def output_value
      pp IRB.CurrentContext.last_value
    end
  end
end

begin
  require 'awesome_print'
  AwesomePrint.force_colors!
  def IRB.ap
    IRB::Irb.class_eval do
      def output_value
        ap IRB.CurrentContext.last_value, :indent => -2
      end
    end
  end
  def IRB.nc
    IRB::Irb.class_eval do
      def output_value
        ap IRB.CurrentContext.last_value, :indent => -2, :plain => true
      end
    end
  end
rescue LoadError
end

def IRB.echo
  IRB.CurrentContext.echo = !IRB.CurrentContext.echo
end

IRB.conf[:ECHO] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE
