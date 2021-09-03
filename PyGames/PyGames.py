class PyGamesOne:
	x = 0
	dimondNum = 6

	def __init__(self, dNum):
			self.dimondNum = dNum

	def bigInArray(self):
		myArr = [123,27,3,4,5]
		bigN = myArr[0]
		for i in myArr:
			if	i<bigN:
				bigN = i
				self.x+=1
		print(bigN, "And position is ",self.x)


		for i in range(1,self.dimondNum):
			#print("x"*int((11-i)/2),"*"*i)
			if i%2 == 0:
				continue
			strLine = " "*int((self.dimondNum-i)/2)+"*"*i
			print(strLine)

		for i in range(self.dimondNum-2,0,-1):
			#print("x"*int((11-i)/2),"*"*i)
			if i%2 == 0:
				continue
			strLine = " "*int((self.dimondNum-i)/2)+"*"*i
			print(strLine)
		
		for x in myArr:
			pass
			#print(x*2)

#bigInArray()
class PyGames:
	def fibo(self,x=9):
		if x ==1 or x==2:		
			return 1
		else:
			return self.fibo(x-1)+self.fibo(x-2)

	def fact(self, x):
		if x<=1:
			return 1
		else:
			return x*self.fact(x-1)

	def testLambda(self):
		return self.fact

	def reverseNum(self, num):
		revNum = 0
		while num>0:
			rem = int(num%10)
			revNum = (revNum*10)+rem
			num=int(num/10)
		return revNum

		
pg = PyGames()
print(pg.fibo())
print(pg.fact(5))
myTestLamb = pg.testLambda()
print("Testing this {}".format(myTestLamb(10)))

#check the input is valid one or not.
#dNum = input("How many stars you wanted to print: ")
#pg = PyGamesOne(int(dNum))
#pg.bigInArray()

#This example is for trying out Tuples

foodItems = ("oranges","kiwi","apple","banana",10,20,30,40)
print("Food Item available "+ str(foodItems[-1])) 
fruits  = list(foodItems[:4])
rates = list(foodItems[5:])
for fr in fruits:
	print(fr)
#converting list to tuple
foodItems = tuple(fruits)
for fr in foodItems:
	print(fr)

myDict = {"one":1,"two":2,"three":3}
print("Dictionary item :"+ str(myDict["one"]))

