import tensorflow as tf
a = tf.random.normal((3,5))
b = tf.random.normal((3))

# broadcast
c = a * b[:,None] # exapnd dim
c = a* tf.expand_dims(b,-1)
c = a* tf.reshape(b,(-1,1))

