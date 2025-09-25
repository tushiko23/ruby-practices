require 'date'
require 'optparse'

# Dateクラスのtodayメソッドと yearとmonthメソッドで今年と今月を取得し、変数year monthにそれぞれ格納する 
year = Date.today.year
month = Date.today.month

# program_calenderメソッドを定義。引数 year monthを指定。 
def program_calendar(year,month)

    # 変数から最初の月と最後の月を取得する 
    first_day = Date.new(year, month, 1)
    last_day = Date.new(year, month, -1)

    # wdayメソッドで最初の月の日の曜日を数値で取得。（日:0,月:1,火:2)
    first_wday = first_day.wday

    # カレンダーの上部を表示　centerメソッドで幅が20で中央寄せ。
    puts "#{month}月 #{year}".center(20," ")
    puts "日 月 火 水 木 金 土"

    # 初日の曜日まで空白を出力 曜日の値によって3スペースとfirst_wdayの数値で位置を決定。
    print "   " * first_wday

    # 各日付を繰り返し出力 date.saturday? 土曜日で改行
    # .rjustメソッド(2)で幅2で右寄せ。
    (first_day..last_day).each do |date|
    print date.day.to_s.rjust(2) + " "
    puts if date.saturday?
    end

    # さらに改行してターミナルの字と重ならないようにする
    puts

end

# オプションの空ハッシュを作成
# .onメソッドで第２引数Integerにすることで数値をoptに登録
# ARGVにコマンドライン引数を格納
options = {}
opt = OptionParser.new

opt.on("-m month",Integer) do |month|
    options[:month] = month
end    
# opt.on("-m month", Integer) { |month| options[:month] = month } 
opt.on("-y year", Integer) do |year| 
    options[:year] = year 
end     
# opt.on("-y year", Integer) { |year| options[:year] = year } 

opt.parse!(ARGV)

# オプションを指定したときは指定した月を、指定しないときは今月を取得して表示する
month = options[:month] || Date.today.month
# オプションを指定したときは指定した年を、指定しないときは今年を取得して表示する
year = options[:year] || Date.today.year

# -m オプションに指定する引数が1~12以外の数値が入力された時にエラーメッセージの表示とプログラムの実行を終了するようにする
if month < 1 || month >= 13
    puts "-m オプションの指定は1~12のみ有効です"
    exit
end

program_calendar(year,month)
