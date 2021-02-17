import base64

MESSAGE = '''
GlUFHA0HFhIURlINEBUGABMIGkNfQUACHVtcVwAVAwxJRElBQAQBQ1VXDBcSTkJEVAQBBx1FREFG UkxJSQ0dAhUEFl5SXgRVWklJBRAJDgQEUl1XDwZRSVREVBQJDR1UW1cFVVpJSRYSAwUIBkQXEltS URoPAhZGS0FVUV9dRlJMSUkTGg9GRg8=
'''
KEY='arvindsagar702'
result = []
for i, c in enumerate(base64.b64decode(MESSAGE)):
    result.append(chr(c ^ ord(KEY[i % len(KEY)])))
print(''.join(result))