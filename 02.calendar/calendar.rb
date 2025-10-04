#!/usr/bin/env ruby
require 'date'
require 'optparse'

year = Date.today.year
month = Date.today.month

def show_calendar(year, month)

  first_day = Date.new(year, month, 1)
  last_day = Date.new(year, month, -1)

  first_wday = first_day.wday

  puts "#{month}月 #{year}".center(20," ")
  puts "日 月 火 水 木 金 土"

  print "   " * first_wday

  (first_day..last_day).each do |date|
    print date.day.to_s.rjust(2) + " "
    puts if date.saturday?
  end

	puts	
end

# -mで月を、-yで年を指定して表示できるようにする
# 通常のcalコマンドは、-yのみ指定すると一年分のカレンダーを表示されますが、今回は指定した年の今月が表示。
options = {}
opt = OptionParser.new

opt.on("-m month",Integer) do |month|
  options[:month] = month
end    

opt.on("-y year", Integer) do |year| 
  options[:year] = year 
end     
 
opt.parse!(ARGV)

month = options[:month] || Date.today.month

year = options[:year] || Date.today.year

# -m オプションに指定する引数が1~12以外の数値が入力された時にエラーメッセージの表示とプログラムの実行を終了するようにする
if month < 1 || month >= 13
  puts "-m オプションの指定は1~12のみ有効です"
  exit
end

show_calendar(year,month)
