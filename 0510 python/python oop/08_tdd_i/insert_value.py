def insert_val_at(index, my_list, value):
	if index+1 > len(my_list) or index+1 < 1:
		return False
	my_list.insert(index, value)
	return my_list

#insert_val_at(3, [1,2,3,4], 99) -> [1, 2, 3, 99, 4]