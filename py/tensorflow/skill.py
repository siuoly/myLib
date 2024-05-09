import tensorflow as tf

################# tensroflow version1 v1 相容性   ###############
import tensorflow.compat.v1 as tf

tf.disable_v2_behavior()

################# pdb ###############
model = tf.keras.layers.dense(10)
model.compile()
model.run_eagerly = True  # use this !! after compile() , then can using pdb

####################################
