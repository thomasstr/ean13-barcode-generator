#!/usr/bin/env ruby

require 'rubygems'
require 'barby'
require 'barby/barcode/ean_13'
require 'barby/outputter/png_outputter'

def directory_exists?(dir)
  File.directory?(dir)
end

def make_random_barcode(number_of_times)
  dir = "barcodes/"
  ean_digits = 100000000000
  file_format = ".png"
  
  if directory_exists?(dir)
  
    rbn = number_of_times.times.map { ean_digits + Random.rand(1000)  }
  
    rbn.each do |r|
      barcode = Barby::EAN13.new(r.to_s)
      File.open(dir+"#{r}#{barcode.checksum}"+file_format, "w") { |file| file.write barcode.to_png }
    end
  else
    puts "Directory does not exist"
  end
end

def barcode_number
  barcode = Barby::EAN13.new("100000000000")
  puts barcode.checksum
end

#barcode_number
make_random_barcode(2)
