print "1-255 = ", (1..255).find_all {|i| i}, "\n\n" # Print 1-255
print "Odd 1-255 = ", (1..255).find_all {|i| i %2 == 1}, "\n\n" # Print odd numbers between 1-255
(0..256).inject {|sum, val| puts "New number: #{val-1} Sum: #{sum}"; sum += val} # Print Sum
x = [1, 3, 5, 7, 9, 13]; print "\nArray = ", x.each {|i|}, "\n\n" # Iterating through an array
y = [-1, 0, 5]; print "Max of ", y, " is ", y.max, "\n\n" # Find Max
z = [0, 5, 13]; print "Average of ", z, " is ", z.inject(0) { |sum,x| sum + x } / z.count, "\n\n" # Get Average
print "Array with Odd Numbers = ", Y = (1..255).find_all {|i| i %2 == 1}, "\n\n" # Array with Odd Numbers

def greater_than(arr, y) # Greater Than y
    print arr.find_all.count { |i| i > y}, " numbers greater than #{y} in array of #{arr}\n\n"
end
greater_than(x,3)

print x.collect { |i| i*i}, "is square of #{x}\n\n" # Square the values
print "Non-negative array = ", y.map! { |i| if (i < 0); i=0 ;else;i;end}, "\n\n" # Eliminate Negative Numbers
print "Max is ", x.max, ". Min is ", x.min, ". Average is ", x.inject(0) { |sum,x| sum + x } / x.count, ". for array of #{x}\n\n" # Max, Min, and Average
print x, " array shifted = "; x.shift; x.push(0); print x, "\n\n" # Shifting the values in the array
neg = [-1, -5, -2, 4, 5, -8]; print "Negative to String array = ", neg.map! { |i| if (i < 0); i="Dojo" ;else;i;end}, "\n\n" # Number to string

# 1-255 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255]

# Odd 1-255 = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57, 59, 61, 63, 65, 67, 69, 71, 73, 75, 77, 79, 81, 83, 85, 87, 89, 91, 93, 95, 97, 99, 101, 103, 105, 107, 109, 111, 113, 115, 117, 119, 121, 123, 125, 127, 129, 131, 133, 135, 137, 139, 141, 143, 145, 147, 149, 151, 153, 155, 157, 159, 161, 163, 165, 167, 169, 171, 173, 175, 177, 179, 181, 183, 185, 187, 189, 191, 193, 195, 197, 199, 201, 203, 205, 207, 209, 211, 213, 215, 217, 219, 221, 223, 225, 227, 229, 231, 233, 235, 237, 239, 241, 243, 245, 247, 249, 251, 253, 255]

# New number: 0 Sum: 0
# New number: 1 Sum: 1
# New number: 2 Sum: 3
# New number: 3 Sum: 6
# New number: 4 Sum: 10
# New number: 5 Sum: 15
# New number: 6 Sum: 21
# New number: 7 Sum: 28
# New number: 8 Sum: 36
# New number: 9 Sum: 45
# New number: 10 Sum: 55
# New number: 11 Sum: 66
# New number: 12 Sum: 78
# New number: 13 Sum: 91
# New number: 14 Sum: 105
# New number: 15 Sum: 120
# New number: 16 Sum: 136
# New number: 17 Sum: 153
# New number: 18 Sum: 171
# New number: 19 Sum: 190
# New number: 20 Sum: 210
# New number: 21 Sum: 231
# New number: 22 Sum: 253
# New number: 23 Sum: 276
# New number: 24 Sum: 300
# New number: 25 Sum: 325
# New number: 26 Sum: 351
# New number: 27 Sum: 378
# New number: 28 Sum: 406
# New number: 29 Sum: 435
# New number: 30 Sum: 465
# New number: 31 Sum: 496
# New number: 32 Sum: 528
# New number: 33 Sum: 561
# New number: 34 Sum: 595
# New number: 35 Sum: 630
# New number: 36 Sum: 666
# New number: 37 Sum: 703
# New number: 38 Sum: 741
# New number: 39 Sum: 780
# New number: 40 Sum: 820
# New number: 41 Sum: 861
# New number: 42 Sum: 903
# New number: 43 Sum: 946
# New number: 44 Sum: 990
# New number: 45 Sum: 1035
# New number: 46 Sum: 1081
# New number: 47 Sum: 1128
# New number: 48 Sum: 1176
# New number: 49 Sum: 1225
# New number: 50 Sum: 1275
# New number: 51 Sum: 1326
# New number: 52 Sum: 1378
# New number: 53 Sum: 1431
# New number: 54 Sum: 1485
# New number: 55 Sum: 1540
# New number: 56 Sum: 1596
# New number: 57 Sum: 1653
# New number: 58 Sum: 1711
# New number: 59 Sum: 1770
# New number: 60 Sum: 1830
# New number: 61 Sum: 1891
# New number: 62 Sum: 1953
# New number: 63 Sum: 2016
# New number: 64 Sum: 2080
# New number: 65 Sum: 2145
# New number: 66 Sum: 2211
# New number: 67 Sum: 2278
# New number: 68 Sum: 2346
# New number: 69 Sum: 2415
# New number: 70 Sum: 2485
# New number: 71 Sum: 2556
# New number: 72 Sum: 2628
# New number: 73 Sum: 2701
# New number: 74 Sum: 2775
# New number: 75 Sum: 2850
# New number: 76 Sum: 2926
# New number: 77 Sum: 3003
# New number: 78 Sum: 3081
# New number: 79 Sum: 3160
# New number: 80 Sum: 3240
# New number: 81 Sum: 3321
# New number: 82 Sum: 3403
# New number: 83 Sum: 3486
# New number: 84 Sum: 3570
# New number: 85 Sum: 3655
# New number: 86 Sum: 3741
# New number: 87 Sum: 3828
# New number: 88 Sum: 3916
# New number: 89 Sum: 4005
# New number: 90 Sum: 4095
# New number: 91 Sum: 4186
# New number: 92 Sum: 4278
# New number: 93 Sum: 4371
# New number: 94 Sum: 4465
# New number: 95 Sum: 4560
# New number: 96 Sum: 4656
# New number: 97 Sum: 4753
# New number: 98 Sum: 4851
# New number: 99 Sum: 4950
# New number: 100 Sum: 5050
# New number: 101 Sum: 5151
# New number: 102 Sum: 5253
# New number: 103 Sum: 5356
# New number: 104 Sum: 5460
# New number: 105 Sum: 5565
# New number: 106 Sum: 5671
# New number: 107 Sum: 5778
# New number: 108 Sum: 5886
# New number: 109 Sum: 5995
# New number: 110 Sum: 6105
# New number: 111 Sum: 6216
# New number: 112 Sum: 6328
# New number: 113 Sum: 6441
# New number: 114 Sum: 6555
# New number: 115 Sum: 6670
# New number: 116 Sum: 6786
# New number: 117 Sum: 6903
# New number: 118 Sum: 7021
# New number: 119 Sum: 7140
# New number: 120 Sum: 7260
# New number: 121 Sum: 7381
# New number: 122 Sum: 7503
# New number: 123 Sum: 7626
# New number: 124 Sum: 7750
# New number: 125 Sum: 7875
# New number: 126 Sum: 8001
# New number: 127 Sum: 8128
# New number: 128 Sum: 8256
# New number: 129 Sum: 8385
# New number: 130 Sum: 8515
# New number: 131 Sum: 8646
# New number: 132 Sum: 8778
# New number: 133 Sum: 8911
# New number: 134 Sum: 9045
# New number: 135 Sum: 9180
# New number: 136 Sum: 9316
# New number: 137 Sum: 9453
# New number: 138 Sum: 9591
# New number: 139 Sum: 9730
# New number: 140 Sum: 9870
# New number: 141 Sum: 10011
# New number: 142 Sum: 10153
# New number: 143 Sum: 10296
# New number: 144 Sum: 10440
# New number: 145 Sum: 10585
# New number: 146 Sum: 10731
# New number: 147 Sum: 10878
# New number: 148 Sum: 11026
# New number: 149 Sum: 11175
# New number: 150 Sum: 11325
# New number: 151 Sum: 11476
# New number: 152 Sum: 11628
# New number: 153 Sum: 11781
# New number: 154 Sum: 11935
# New number: 155 Sum: 12090
# New number: 156 Sum: 12246
# New number: 157 Sum: 12403
# New number: 158 Sum: 12561
# New number: 159 Sum: 12720
# New number: 160 Sum: 12880
# New number: 161 Sum: 13041
# New number: 162 Sum: 13203
# New number: 163 Sum: 13366
# New number: 164 Sum: 13530
# New number: 165 Sum: 13695
# New number: 166 Sum: 13861
# New number: 167 Sum: 14028
# New number: 168 Sum: 14196
# New number: 169 Sum: 14365
# New number: 170 Sum: 14535
# New number: 171 Sum: 14706
# New number: 172 Sum: 14878
# New number: 173 Sum: 15051
# New number: 174 Sum: 15225
# New number: 175 Sum: 15400
# New number: 176 Sum: 15576
# New number: 177 Sum: 15753
# New number: 178 Sum: 15931
# New number: 179 Sum: 16110
# New number: 180 Sum: 16290
# New number: 181 Sum: 16471
# New number: 182 Sum: 16653
# New number: 183 Sum: 16836
# New number: 184 Sum: 17020
# New number: 185 Sum: 17205
# New number: 186 Sum: 17391
# New number: 187 Sum: 17578
# New number: 188 Sum: 17766
# New number: 189 Sum: 17955
# New number: 190 Sum: 18145
# New number: 191 Sum: 18336
# New number: 192 Sum: 18528
# New number: 193 Sum: 18721
# New number: 194 Sum: 18915
# New number: 195 Sum: 19110
# New number: 196 Sum: 19306
# New number: 197 Sum: 19503
# New number: 198 Sum: 19701
# New number: 199 Sum: 19900
# New number: 200 Sum: 20100
# New number: 201 Sum: 20301
# New number: 202 Sum: 20503
# New number: 203 Sum: 20706
# New number: 204 Sum: 20910
# New number: 205 Sum: 21115
# New number: 206 Sum: 21321
# New number: 207 Sum: 21528
# New number: 208 Sum: 21736
# New number: 209 Sum: 21945
# New number: 210 Sum: 22155
# New number: 211 Sum: 22366
# New number: 212 Sum: 22578
# New number: 213 Sum: 22791
# New number: 214 Sum: 23005
# New number: 215 Sum: 23220
# New number: 216 Sum: 23436
# New number: 217 Sum: 23653
# New number: 218 Sum: 23871
# New number: 219 Sum: 24090
# New number: 220 Sum: 24310
# New number: 221 Sum: 24531
# New number: 222 Sum: 24753
# New number: 223 Sum: 24976
# New number: 224 Sum: 25200
# New number: 225 Sum: 25425
# New number: 226 Sum: 25651
# New number: 227 Sum: 25878
# New number: 228 Sum: 26106
# New number: 229 Sum: 26335
# New number: 230 Sum: 26565
# New number: 231 Sum: 26796
# New number: 232 Sum: 27028
# New number: 233 Sum: 27261
# New number: 234 Sum: 27495
# New number: 235 Sum: 27730
# New number: 236 Sum: 27966
# New number: 237 Sum: 28203
# New number: 238 Sum: 28441
# New number: 239 Sum: 28680
# New number: 240 Sum: 28920
# New number: 241 Sum: 29161
# New number: 242 Sum: 29403
# New number: 243 Sum: 29646
# New number: 244 Sum: 29890
# New number: 245 Sum: 30135
# New number: 246 Sum: 30381
# New number: 247 Sum: 30628
# New number: 248 Sum: 30876
# New number: 249 Sum: 31125
# New number: 250 Sum: 31375
# New number: 251 Sum: 31626
# New number: 252 Sum: 31878
# New number: 253 Sum: 32131
# New number: 254 Sum: 32385
# New number: 255 Sum: 32640

# Array = [1, 3, 5, 7, 9, 13]

# Max of [-1, 0, 5] is 5

# Average of [0, 5, 13] is 6

# Array with Odd Numbers = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57, 59, 61, 63, 65, 67, 69, 71, 73, 75, 77, 79, 81, 83, 85, 87, 89, 91, 93, 95, 97, 99, 101, 103, 105, 107, 109, 111, 113, 115, 117, 119, 121, 123, 125, 127, 129, 131, 133, 135, 137, 139, 141, 143, 145, 147, 149, 151, 153, 155, 157, 159, 161, 163, 165, 167, 169, 171, 173, 175, 177, 179, 181, 183, 185, 187, 189, 191, 193, 195, 197, 199, 201, 203, 205, 207, 209, 211, 213, 215, 217, 219, 221, 223, 225, 227, 229, 231, 233, 235, 237, 239, 241, 243, 245, 247, 249, 251, 253, 255]

# 4 numbers greater than 3 in array of [1, 3, 5, 7, 9, 13]

# [1, 9, 25, 49, 81, 169]is square of [1, 3, 5, 7, 9, 13]

# Non-negative array = [0, 0, 5]

# Max is 13. Min is 1. Average is 6. for array of [1, 3, 5, 7, 9, 13]

# [1, 3, 5, 7, 9, 13] array shifted = [3, 5, 7, 9, 13, 0]

# Negative to String array = ["Dojo", "Dojo", "Dojo", 4, 5, "Dojo"]
