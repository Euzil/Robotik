Q=[0.3137,0.1255,0.9410,0.0188]
Q_inv =quatinv(Q)
Q_nor =quatnormalize(Q)
Q_conj=quatconj(Q)
one_p=[36/21, 10/3, -1/2]

zero_w=quatmultiply(quatmultiply(Q_inv, [0, one_p]),quatconj(Q_inv))

zero_p=zero_w(1,2:4)
