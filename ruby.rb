 (4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 64, 68, 72, 76, 80, 84, 88, 92, 96, 100, 104, 108)


# 1. Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными.

array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# even = array.select.with_index { |el, ind| ind.even? }
# odd = array.select.with_index { |el, ind| ind.odd? }
# result = even + odd #=> [0, 2, 4, 6, 8, 1, 3, 5, 7, 9]

array.partiton.with_index { |el, ind| ind.even? }.flatten

# 3. Дан целочисленный массив. Вывести номер первого из тех его элементов,
# которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ].

index = array.detect.with_index { |el, ind| ind if el > array[0] && el < array[-1] } || []

#4. Дан целочисленный массив. Вывести номер последнего из тех его элементов,
# которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ].

arr = array.map.with_index { |el, ind| ind if el > array[0] && el < array[-1] }.compact || []

# 5. Дан целочисленный массив. Преобразовать его, прибавив к четным числам первый элемент. Первый и последний элементы массива не изменять.

array = [3, 1, 2, 3, 4, 5, 6, 7, 8, 9]
result = array.map.with_index { |el, ind| ind == 0 || ind == array.length - 1 ? el : el + array[0] }
# => [3, 4, 5, 6, 7, 8, 9, 10, 11, 9]

# 6.  Дан целочисленный массив. Преобразовать его, прибавив к четным числам последний элемент. Первый и последний элементы массива не изменять.

result = array.map.with_index { |el, ind| ind == 0 || ind == array.length - 1 ? el : (el.even? ? el + array[-1] : el)}
# => [3, 1, 11, 3, 13, 5, 15, 7, 17, 9]

# 7. Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам последний элемент. Первый и последний элементы массива не изменять.

result = array.map.with_index { |el, ind| ind == 0 || ind == array.length - 1 ? el : (el.odd? ? el + array[-1] : el)}
# => [3, 10, 2, 12, 4, 14, 6, 16, 8, 9]

# 8. Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам первый элемент. Первый и последний элементы массива не изменять.

result = array.map.with_index { |el, ind| ind == 0 || ind == array.length - 1 ? el : (el.odd? ? el + array[0] : el)}
# => [3, 4, 2, 6, 4, 8, 6, 10, 8, 9]

# 9. Дан целочисленный массив. Заменить все положительные элементы на значение минимального.

array = [3, 5, 6, -2, 5, -8, 9, 9]
result = array.map { |el| el >= 0 ? array.min : el }
# => [-8, -8, -8, -2, -8, -8, -8, -8]

# 10. Дан целочисленный массив. Заменить все положительные элементы на значение максимального.

result = array.map { |el| el >= 0 ? array.max : el }
# => [9, 9, 9, -2, 9, -8, 9, 9]

# 11. Дан целочисленный массив. Заменить все отрицательные элементы на значение минимального.

result = array.map { |el| el < 0 ? array.min : el }

# 12. Дан целочисленный массив. Заменить все отрицательные элементы на значение максимального

result = array.map { |el| el < 0 ? array.max : el }

# 13. Дан целочисленный массив. Осуществить циклический сдвиг элементов массива влево на одну позицию.

result = array << array.shift
# => [5, 6, -2, 5, -8, 9, 9, 3]

# 14. Дан целочисленный массив. Осуществить циклический сдвиг элементов массива вправо на одну позицию.

# result = array.unshift(array.pop)
# => [9, 3, 5, 6, -2, 5, -8, 9]
result = array.rotate -1
# => [9, 3, 5, 6, -2, 5, -8, 9]

# 15. Дан целочисленный массив. Проверить, образуют ли элементы арифметическую прогрессию.
# Если да, то вывести разность прогрессии, если нет - вывести nil.

array = [1, 4, 7, 10, 13, 16]
# diffs = array.map.with_index { |el, ind| array[ind+1] - el if ind != array.length - 1 }.compact.uniq
# result = diffs.size == 1 ? diffs.first : nil

diff = array[1] - array[0]
array[0...-1].each_index.any?{ |i| array[i] + diff != array[i+1] } ? nil : diff

# 16. Дан целочисленный массив. Проверить, образуют ли элементы геометрическую прогрессию.
# Если да, то вывести знаменатель прогрессии, если нет - вывести nil.

array = [2, 4, 8, 16, 32, 64]
# diffs = array.map.with_index { |el, ind| array[ind+1] / el if ind != array.length - 1 }.compact.uniq
# result = diffs.size == 1 ? diffs.first : nil

diff = array[1] / array[0]
array[0...-1].each_index.any?{ |i| array[i] * diff != array[i+1] } ? nil : diff

#17. Дан целочисленный массив. Найти количество его локальных максимумов.

array = [2, 4, 5, 4, 3, 5, 6, 3, 2, 7]
local_maxs = array.map.with_index { |el, ind| el if el > (array[ind-1] ? array[ind-1] : 0) && el > (array[ind+1] ? array[ind+1] : 0)}.compact.size

# 18. Дан целочисленный массив. Найти количество его локальных минимумов.

array = [2, 4, 5, 4, 3, 5, 6, 3, 2, 7]
local_mins = array.map.with_index { |el, ind| el if el < (array[ind-1] ? array[ind-1] : 0) && el < (array[ind+1] ? array[ind+1] : 0)}.compact.size

# 19. Дан целочисленный массив. Найти максимальный из его локальных максимумов.

array = [2, 4, 5, 4, 3, 5, 6, 3, 2, 7]
local_max = array.map.with_index { |el, ind| el if el > (array[ind-1] ? array[ind-1] : 0) && el > (array[ind+1] ? array[ind+1] : 0)}.compact.max

# 20. Дан целочисленный массив. Найти минимальный из его локальных минимумов.

array = [2, 4, 5, 4, 3, 5, 6, 3, 2, 7]
local_max = array.map.with_index { |el, ind| el if el < (array[ind-1] ? array[ind-1] : 0) && el < (array[ind+1] ? array[ind+1] : 0)}.compact.min

# 21. Дан целочисленный массив. Определить количество участков, на которых его элементы монотонно возрастают.

array = [2, 4, 5, 4, 3, 5, 6, 3, 2, 7]
def count_incr array
  count = 0
  trigger = false
  array.each_with_index do |el, ind|
    return count if ind == (array.size - 1)
    if el < array[ind + 1]
      count += 1 if !trigger
      trigger = true
    else
      trigger = false
    end
  end
  count
end

count_incr array


# 24 Дано вещественное число R и массив вещественных чисел. Найти элемент массива, который наименее близок к данному числу

array = [2.787, 4.1, 5.567, 4.987, 3.12345, 5.456, 6.56798, 3.234, 2.234, 7.7878]
r = 4.1234
# diff_arr = array.map { |el| (el - r).abs }
# result = array[diff_arr.index(diff_arr.max)]

array.map { |el| [(r - el).abs, el] }.max[1]

# 28 Дан целочисленный массив. Преобразовать его, вставив после каждого отрицательного элемента нулевой элемент.

array = [2, -4, 5, -4, -3, 5, -6, 3, -2, 7]
result = array.each_with_object([]) { |i, a| a << i; a << array[0] if i < 0; a }
# => [2, -4, 2, 5, -4, 2, -3, 2, 5, -6, 2, 3, -2, 2, 7]

# 32 Дан целочисленный массив. Вывести индексы массива в том порядке, в котором
# соответствующие им элементы образуют возрастающую последовательность.

array = [2, 4, 5, 4, 3, 5, 6, 3, 2, 7]
result = array.map.with_index { |el, ind| [el, ind] }.sort.map { |i| i[1] }
# => [0, 8, 4, 7, 1, 3, 2, 5, 6, 9]

result = array.each_index.sort{ |a,b| arr[b] <=> arr[a] }

# 36 Дан целочисленный массив. Найти индекс первого максимального элемента.

array = [2, 4, 5, 7, 9, 5, 6, 9, 2, 7]
result = array.index(array.max)

# 40 Дан целочисленный массив. Найти количество максимальных элементов.

array = [2, 4, 5, 7, 9, 5, 6, 9, 2, 7]
result = array.select { |i| i == array.max }.size

result = array.count array.max

# 44 Дан целочисленный массив. Найти максимальный нечетный элемент.

array = [2, 4, 5, 7, 9, 5, 6, 9, 2, 7]
result = array.select { |i| i.odd? }.max

# 48 Дан целочисленный массив и интервал a..b. Найти максимальный из элементов в этом интервале.

array = [2, 4, 5, 7, 9, 5, 6, 9, 2, 7]
range = 2..6
# array[a..b].max

result = array.select { |el| range.include? el }.max

# 52 Дан целочисленный массив. Найти количество элементов, расположенных после первого минимального.

array = [3, 4, 5, 2, 7, 9, 5, 6, 9, 2, 7]
# result = array.slice((array.index(array.min)+1), array.size).size

result = array.size - 1 - array.index(array.max)

# 56 Дан целочисленный массив. Найти количество элементов, расположенных после последнего минимального.

array = [3, 4, 5, 2, 7, 9, 5, 2, 6, 9, 3, 7]
# result = array.size - 1 - array.map.with_index { |el, ind| ind if el == array.min }.compact.last
result = array.size - 1 - array.rindex(array.min)

# 60 Дан целочисленный массив. Найти количество элементов, между первым и последним максимальным.

array = [3, 4, 9, 2, 7, 9, 5, 6, 9, 3, 7]
indexes = array.each_index.select { |ind| array[ind] == array.max }
result = indexes[-1] - indexes[0] - 1

result = array.rindex(array.max) - array.index(array.max) - 1

# 64 Дан целочисленный массив. Найти максимальное количество подряд идущих максимальных элементов.

array = [3, 4, 9, 9, 9, 9, 2, 7, 9, 9, 5, 6, 9, 9, 9, 9, 9, 3, 7]
def count_of_max array
  a, res = 0, 1
  array.each do |el|
    if el == array.max
      a += 1
    elsif el != array.max && a != 0
      a > res ? res = a : res
      a = 0
    end
  end
  res
end


# 68 Дан целочисленный массив. Проверить, чередуются ли в нем положительные и отрицательные числа.

array = [3, -4, 9, -2, 7, -9, 5, -6, 9, -3, 7, 4]
def odd_even array
  a = true
  (0..array.size-2).step(2) do |ind|
    return a = false if array[ind] * array[ind+1] > 0
  end
  a
end

# 72 Дан целочисленный массив. Удалить все элементы, встречающиеся более двух раз.

array = [1, 3, 5, 4, 5, 4, 6, 7, 5, 4, 6, 5, 2, 7]
# result = array.map { |el| el if array.select { |i| i == el }.count <= 2 }.compact

result = array.delete_if { |item| a.count(item)>2 }


# 76 Дан целочисленный массив. Найти среднее арифметическое квадратов его элементов.

array = [1, 3, 5, 4, 5, 4, 6, 7, 5, 4, 6, 5, 2, 7]
result = array.inject(0.0) { |sum, n| sum + n * n } / array.size


# 80 Дан дипапазон a..b. Получить массив из чисел,
# расположенных в этом диапазоне (исключая сами эти числа), в порядке их возрастания, а также размер этого массива.

range = 1..18
result = range.each_with_object([]) { |el, a| a << el }.sort
size = result.size


# 84 Дано натуральное число N. Найти результат следующего произведения 1*2*…*N.

(1..N).inject(1) { |res, el| res * el}


# 88 Дан целочисленный массив. Найти количество четных элементов.

array = [1, 3, 5, 4, 5, 4, 6, 7, 5, 4, 6, 5, 2, 7]
result = array.select { |el| el.even? }.size


# 92 Дан целочисленный массив и число К. Если существует элемент, больший К, то вывести true; в противном случае вывести false.

array.max > K


# 96 Дан целочисленный массив и число К. Вывести индекс первого элемента, большего К.

array.index(array.detect { |el| el > K })


# 100 Дан целочисленный массив. Вывести индексы элементов, которые больше своего правого соседа, и количество таких чисел.

array = [1, 3, 5, 4, 5, 4, 6, 7, 5, 4, 6, 5, 2, 7]
inds = 0...array.size - 1
result = inds.select { |i| array[i] > array[i+1] }
size = result.size

# 104 Дан целочисленный массив. Проверить, образует ли он упорядоченную последовательность.

array == array.sort


# 108 Дан целочисленный массив и целое число К. Возвести в степень К все элементы массива.

array = [1, 3, 5, 4, 5, 4, 6, 7, 5, 4, 6, 5, 2, 7]
result = array.map { |el| el ** K }

 (4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 64, 68, 72, 76, 80, 84, 88, 92, 96, 100, 104, 108)






# Сортировка массива: чет/нечет, обратный порядок, массив строк упорядочить по длине слов (группировка по длине слов)

# чет/нечет
array = [1, 3, 5, 4, 5, 4, 6, 7, 5, 4, 6, 5, 2, 7]
array.sort_by { |i| [i%2, i] } # Женя показал:)

even = array.select { |el| el.even? }.sort
odd = array.select { |el| el.odd? }.sort
result = even + odd

# => [2, 4, 4, 4, 6, 6, 1, 3, 5, 5, 5, 5, 7, 7]


# обратный порядок

array = [1, 3, 5, 4, 5, 4, 6, 7, 5, 4, 6, 5, 2, 7]
array.each_with_object([]) { |el, a| a.unshift(el) }
# => [7, 2, 5, 6, 4, 5, 7, 6, 4, 5, 4, 5, 3, 1]

# массив строк упорядочить по длине слов (группировка по длине слов)

array = ['indexing starts at 0,', 'as in C', 'or', 'Java. A negative', 'index is assumed to be relative']
array.sort { |x, y| x.length <=> y.length }.group_by{ |i| i.length }

# => {2=>["or"], 7=>["as in C"], 16=>["Java. A negative"], 21=>["indexing starts at 0,"], 31=>["index is assumed to be relative"]}

# Поиск в массиве: локальные максимумы

array = [1, 3, 5, 4, 5, 4, 6, 7, 5, 4, 6, 5, 2, 7]
array.map.with_index { |el, ind| el if el > (array[ind-1] ? array[ind-1] : 0) && el > (array[ind+1] ? array[ind+1] : 0)}.compact
# => [5, 5, 7, 6, 7]

# написать map, select, detect, count, all?, any? через reduce (своя реализация)
module ArrayExtantion
  #map
    def self.reduce_map(array)
      array.reduce([]){ |a, el| block_given? ? a << yield(el) : array.to_enum(:reduce_map) }
    end

  # select
    def self.reduce_select(array)
      array.reduce([]){ |a, el| block_given? ? (yield(el) ? a << el : a) : array.to_enum(:reduce_select) }
    end

  # count
    def self.reduce_count(array, n=nil)
      if n
        reduce_select(array) { |el| el == n }.reduce(0) { |a| a + 1 }
      elsif block_given?
        array.reduce(0) { |a, el| yield(el) ? a + 1 : a }
      else
        array.reduce(0) { |a| a + 1 }
      end
    end

  # all?
    # def self.reduce_all?(array)
    #   if block_given?
    #     !array.reduce([]) { |a, el| a << false if yield(el) }.include? false
    #   else
    #     !array.reduce([]) { |a, el| a << false if el != nil && el != false }.include? false
    #   end
    # end

  # all?
    def self.reduce_all?(array)
      if block_given?
        array.reduce(true) { |a, el| return false if !yield(el); a }
      else
        array.reduce(true) { |a, el| return false if el == nil || el == false; a }
      end
    end


  # any?
    def self.reduce_any?(array)
      if block_given?
        array.reduce(false) { |a, el| return true if yield(el); a }
      else
        array.reduce(false) { |a, el| return true if el != nil && el != false; a }
      end
    end

  # flatten
    def self.flatten(array, res=[])
      array.each do |item|
        if item.is_a?(Array)
          flatten(item, res)
        else
          res << item
        end
      end
      res
    end
end

ArrayExtantion::reduce_map(array)
ArrayExtantion::reduce_select(array)
ArrayExtantion::reduce_count(array)
ArrayExtantion::reduce_all?(array)
ArrayExtantion::reduce_any?(array)

array = [[[1, 2, 3, 4], 5, 5, 7], 7, 4, [3, 5, [4, 5, 6]]]
ArrayExtantion::flatten(array)
=> [1, 2, 3, 4, 5, 5, 7, 7, 4, 3, 5, 4, 5, 6]

# hash merge

  def merge(h1, h2)
    res = {}
    h1.each do |k, val|
      if block_given?
        res[k] = h2[k] ? yield(k, h1[k], h2[k]) : val
      else
        res[k] = h2[k] ? val + h2[k] : val
      end
    end
    keys = h2.keys - res.keys
    keys.each do |k|
      res[k] = h2[k]
    end
    res
  end

h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 254, "c" => 300 }
#=> {"a"=>100, "b"=>454, "c"=>300}


# группировка(дан массив имен-фамилий, написать алгоритм поиска однофамильцев)

array = ["Alexander Dmitrenko", "Alexander Katasonov", "Anastasia Sakhno", "Nickolay Katasonov", "Andrey Katasonov"]

# array.map! { |item| item.split(' ').reverse }
# array.each_with_object(Hash.new) { |item, a| a[item[0]] = array.select { |i| i[0] == item[0] } }

array.each_with_object({}) { |item, a| name, family = item.split(' '); a[family] ||=[]; a[family] << name }

def find_homonym array
  array.each_with_object({}) do |item, a|
    name, family = item.split(' ')
    a[family] ||=[]
    a[family] << name
  end
end

find_homonym array

# => {"Dmitrenko"=>["Alexander"], "Katasonov"=>["Alexander", "Nickolay", "Andrey"], "Sakhno"=>["Anastasia"]}
