#Program to split vowels from a given string after converting it to uppercase.

import re
s1=input().upper()
s1=re.split('A{,}|E{,}|I{,}|O{,}|U{,}',s1)
s1=''.join(s1)
print(s1)