import datetime

#take now time:
now_year    = datetime.datetime.now().year
now_month   = datetime.datetime.now().month
now_day     = datetime.datetime.now().day

#take user birthday
user_year   = int(input("enter your year: "))
user_month  = int(input("enter your month: "))
user_day    = int(input("enter your day: "))

#change all input to dayes (destrcture)
#1 year     = 365 day
#1 month    = 30.417 day thanks google assistant :D Think like a genius B:
your_days = (now_year - user_year)*365 + (now_month - user_month )*30.417 + (now_day - user_day)

#print(your_days) ensure line

#change all dayes to years,months and dayes (Build)
#first build month
your_months = your_days / 30.417

#second build years
your_years = 0
while int(your_months) > 12 :
    your_years  += 1
    your_months -= 12

#print(your_years , your_months) another ensure line

#third build dayes (actully redetermine dayes)
your_days = your_months - int(your_months)      #here i want to determine days as non-compeleted months
your_days = your_days * 30.417                 #sorry for re-determine the same variable 

#Show ouput in screan :
print('your age')
print(str(your_years) +" years " + str(int(your_months)) + " months " + str(int(your_days)) +" days")


#here we go 
#Note : you can use the float of your_days to get hours , then use the float of hours to get min ( :O )
#Note2: my code works only with the right numbers , With few edit we can make it react with wrong numbers
#Author : Ahmed Khaled
#Written by vim text editor , useing Fedora OS (thnx for FreeSource community , and thnx for google assistant for his information 
