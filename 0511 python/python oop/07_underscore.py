class Underscore(object):
    # map
    # produces a new list of values by mapping each value through
    # a transformation function, lambda
    def map(self, iterable, function):
        for i in range(len(iterable)):
            iterable[i] = function(iterable[i])
        return iterable 
    # reduce
    # boils the elements of a list down to a single value
    def reduce(self, iterable, function, memo):
        for num in iterable:
           memo = function(memo,num)
        return memo
    # find
    # determine whether a value exists within a list of values
    def find(self, iterable, function):
        for num in iterable:
            if function(num):
                return num
        return false
    # filter
    # looks through the values in a list returning an array of all the values
    # that meet a specific condition
    def filter(self, iterable, function):
        matches = []
        for num in iterable:
            if function(num):
                matches.append(num)
        return matches
    # reject
    # looks through the values in a list returning an array of all the values
    # that do not meet a specific condition
    def reject(self, iterable, function):
        rejected = []
        for num in iterable:
            if not function(num):
                rejected.append(num)
        return rejected

# let's create an instance of our class
_ = Underscore() # yes we are setting our instance to a variable that is an underscore

evens = _.filter([1, 2, 3, 4, 5, 6], lambda x: x % 2 == 0)
print evens # should return [2, 4, 6] after you finish implementing the code above

finds = _.find([1, 2, 3, 4, 5, 6], lambda x: x % 2 == 0)
print finds

mappings = _.map([1, 2, 3, 4, 5, 6], lambda x: x * 3)
print mappings

reducing = _.reduce([1, 2, 3, 4, 5, 6], (lambda x, y: x + y), 0)
print reducing

rejecting = _.reject([1, 2, 3, 4, 5, 6], lambda x: x % 2 == 0)
print rejecting

print _.reduce([1, 2, 3, 4, 5, 6], lambda x, y: x + y, 0) # 21
print _.filter([1, 2, 3, 4, 5, 6], lambda x: x % 2 == 1) # [1, 3, 5]
print _.find([1, 2, 3, 4, 5, 6], lambda x: 3) # 1
print _.filter([1, 2, 3, 4, 5, 6], lambda x: x % 2 != 1) # [2, 4, 6]
print _.map([1, 2, 3, 4, 5, 6], lambda x: x * 3) # [3, 6, 9, 12, 15, 18]

# [2, 4, 6]
# 2
# [3, 6, 9, 12, 15, 18]
# 21
# [1, 3, 5]
# 21
# [1, 3, 5]
# 1
# [2, 4, 6]
# [3, 6, 9, 12, 15, 18]
