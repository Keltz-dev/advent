require 'pry'
array = %w[1864
1880
1300
1961
1577
1900
1307
1818
1736
1846
1417
1372
1351
1860
1738
1525
1798
1218
1723
1936
1725
1998
1466
1922
1782
1947
1717
1914
1843
1732
1918
814
1771
1712
1804
1213
1859
1820
1793
1870
1993
1787
1824
1849
1646
1489
1348
1978
1628
1781
2002
1297
1829
1596
1819
1313
1413
1726
1449
1810
1295
1679
1358
1949
1644
1825
1891
490
1962
1939
1228
1889
1977
1980
1763
1752
1983
1785
1678
2000
1857
1658
1863
1330
1380
1799
1789
1633
1663
296
1985
1117
1239
1854
1960
2004
1940
1876
1739
1858
1283
1423
1982
1836
1451
1840
1347
1652
1695
1210
1861
1199
1346
1786
1814
1958
1853
1974
1917
1308
654
1743
1847
1367
1559
1614
1897
2003
1886
1885
1682
1204
1986
1816
1994
1817
1751
1701
1619
1970
816
1852
1832
1631
703
1604
1444
1842
1984
1259
1948
1620
1681
1822
1865
1521
1741
1455
1909
1764
261
1464
1905
1325
1766
1749
1292
1874
1267
1269
1969
1991
1219
1345
1976
1369
1942
1388
1776
1629
1987
1684
1813
1203
1965
1729
1930
1609
1801
1402
121
1833
1898
1957
1051
1430
1893
1784
1800
1910].map(&:to_i).sort
# number = 0
# number2 = 0
# number3 = 0
# array.each do |num|
#   closing_bracket = -1
#   array.each do |num2|
#     while num2 + num + array[closing_bracket] > 2020 && array[closing_bracket] > num2  do
#       closing_bracket -= 1
#     end
#     if num2 + num + array[closing_bracket] == 2020
#       number = num
#       number2 = num2
#       number3 = array[closing_bracket]
#       break
#     end
#   end
# end
# puts number * number2 * number3
# p [number, number2, number3]



def doit(arr, i, max, min)
  c = 1
  while arr[i] + arr[i + c] < max
    z = -1
    sum = arr[i] + arr[i + c] + arr[z]

    while sum > 2020 do
      z -= 1
      sum = arr[i] + arr[i + c] + arr[z]
    end

    return arr[i] * arr[i + c] * arr[z] if sum == 2020
    arr.slice!((z + 1)..-1) if z < -1


    x = c - 2
    x = 1 if x <= 0

    binding.pry
    result = doit(arr, (i + 1), (sum - arr.last), (arr[i] + arr[i + x])) if sum > (arr[i + 1] + arr[i + 2] + arr.last) && (arr[i + 1] + arr[i + 2] + arr.last) >= min
    binding.pry
    c += 1
  end
  result
end

puts doit(array, 0, 2020, 0)
# 162292410
