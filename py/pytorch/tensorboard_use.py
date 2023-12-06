from torch.utils.tensorboard import SummaryWriter
import numpy as np

# w = SummaryWriter() # runs/DATE_TIME_HOST
w = SummaryWriter(log_dir="exp1") # exp1
# w = SummaryWriter(log_dir="runs/exp1") # runs/exp1
# w = SummaryWriter(comment="LR_01_BATCH_16") #runs/TIME_HOSTLR_0.1_BATCH_16/

w.add_scalar("loss",100)
w.add_scalar("loss",99)
w.add_scalar("loss",98)

w.add_scalar("Accuracy",0.8)
w.add_scalar("Accuracy",0.9)
w.add_scalar("Accuracy",1.0)

w.add_scalars("Metrics",{
    "Accuracy":0.9,
    "Precision": 0.8,
    "F1": 0.6
    })

for n_iter in range(100):
    w.add_scalar('Loss/train', np.random.random(), n_iter)
    w.add_scalar('Loss/test', np.random.random(), n_iter)
    w.add_scalar('Accuracy/train', np.random.random(), n_iter)
    w.add_scalar('Accuracy/test', np.random.random(), n_iter)

w.close()

# $sh: tensorboard --logdir=runs
# $sh: tensorboard --logdir=runs/exp1
# $sh: tensorboard --port 6006(default)

# (listening all interface(public network), default 
# localhost only)
# $sh: tensorboard --bind_all 

# C:client, W:remote workstation
# [W]$ ssh -R 7777:localhost:6006 C 
# [W]$ tensorboard --port 6006 --logdir XXX
# [C]$ browser: localhost:7777

# C:client, W:remote workstation
# [W]$ tensorboard --port 6006 --logdir XXX
# [C]$ ssh -L 7777:localhost:6006 W
# [C]$ browser: localhost:7777
