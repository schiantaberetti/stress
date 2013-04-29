#!/usr/bin/env ruby

require 'xml-object'

class TestElement
	attr_accessor :id, :type, :name, :data
	def initialize(id,type,name,data)
		@id=id
		@type=type
		@name=name
		@data=data
	end

	def to_s()
		return "#{@id} - #{@name} - #{@data}"
	end
end

class TestCase
	attr_accessor :events

	def initialize(inputfile)
		@events = []
		testfile = File.new(inputfile)
		testcase = XMLObject.new(testfile)

		testcase.reads.each { |read_element|
			@events.push(TestElement.new(read_element.id.to_i,read_element.type,read_element.name,read_element.data.split("%x").join))
		}

		testcase.sends.each { |send_element|
			@events.push(TestElement.new(send_element.id.to_i,send_element.type,send_element.name,send_element.data.split("%x").join))
		}

		@events.sort!{|a,b| a.id <=> b.id }

		puts @events
	end
end

if ARGV[0]
	tc = TestCase.new(ARGV[0])
else
	puts "Error: no input file given"
end
