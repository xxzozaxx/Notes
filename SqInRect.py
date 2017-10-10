"""
This screipt programmed by Ahmed Khaled as a learining screipt 

Task : Cut a "true" rectangle into squares
for more info : https://www.codewars.com/kata/rectangle-into-squares/python
"""

def sqInRect(lng, wdth):
    # your code
    result = []
    if lng == wdth :
        return None
    else:
        area = lng * wdth
        while area > 0 :
            if lng < wdth :
                result.append(lng)
                area -= lng*lng
                wdth -= lng
            else :
                result.append(wdth)
                area -= wdth*wdth
                lng -= wdth
        return result

print (sqInRect(14,20))
