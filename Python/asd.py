def number_of_decodings_fast(code):
    """ Dynamic programming implementation which runs in 
    O(n) time and O(1) space. 
    The implementation is very similar to the dynamic programming
    solution for the Fibonacci series. """
    length = len(code)
    if (length <= 1):
        # assume all such codes are unambiguously decodable
        return 1
    else:
        n_prev = 1 # len 0
        n_current = 1 # len 1
        for i in range(1,length):
            if (
                # a '1' is ambiguous if followed by
                # a digit X=[1-9] since it could be
                # decoded as '1X' or '1'+'X'
                code[i-1]=='1' and 
                code[1] in [str(k) for k in (range(1,10))]
            ) or (
                # a '2' is ambiguous if followed by 
                # a digit X=[1-6] since it could be
                # decoded as '2X' or '2'+'X'
                code[i-1]=='2' and 
                code[i] in [str(k) for k in range(1,7)]
            ):
                # New number of decodings is the sum of
                # decodings obtainable from the code two digits back
                # (code[0:(i-2)] + '[1-2]X' interpretation)
                # and decodings obtainable from the code one digit back
                # (code[0:(i-1)] + 'X' interpretation).
                n_new = n_prev + n_current
            else:
                # New number of decodings is the same as
                # that obtainable from the code one digit back
                # (code[0:(i-1)] + 'X' interpretation).
                n_new = n_current
            # update n_prev and n_current
            n_prev = n_current
            n_current = n_new
        return n_current


b=raw_input()
print(number_of_decodings_fast(b))