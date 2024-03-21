import tensorflow as tf
################# pdb ###############
model = tf.keras.layers.dense(10)
model.compile()
model.run_eagerly = True # use this !! after compile() , then can using pdb

####################################

