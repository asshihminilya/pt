class Task
  def initialize(title)
    @title = title
    @done = false
  end

  def mark_done
    @done = true
  end

  def to_s
    status = @done ? "[x]" : "[ ]"
    "#{status} #{@title}"
  end
end

tasks = []

loop do
  puts "\n1. Добавить задачу"
  puts "2. Показать все задачи"
  puts "3. Отметить задачу выполненной"
  puts "4. Удалить задачу"
  puts "5. Выход"

  print "Выбери действие: "
  choice = gets.chomp

  case choice
  when "1"
    print "Введи название: "
    task_name = gets.chomp
    tasks << Task.new(task_name)

  when "2"
    if tasks.empty?
      puts "Задач нет"
    else
      tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end
    end

  when "3"
    if tasks.empty?
      puts "Задач нет"
    else
      tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end

      print "Какая задача выполнена? Введи номер: "
      number = gets.to_i

      if number < 1 || number > tasks.size
        puts "Нет такой задачи"
      else
        tasks[number - 1].mark_done
        puts "Задача отмечена выполненной!"
      end
    end


  when "4"
    if tasks.empty?
      puts "Задач нет"
    else
      puts "Какую задачу нужно удалить?"
      number = gets.to_i
      if number < 1 || number > tasks.size
        puts "Нет такой задачи"
      else
        number = gets.to_i - 1
        task = tasks.delete_at(number)
        puts "Задача удалена"
      end
    end


  when "5"
    puts "Завершение работы"
    break
  end

end


