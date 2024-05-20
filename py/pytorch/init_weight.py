# Understanding the difficulty of training deep feed- forward neural networks initialize weight
# W_ij ~ U[ -1/√ n, 1/√n ]
import matplotlib.pyplot as plt
import numpy as np
from numpy import sqrt
import torch

n = 10
x = np.random.uniform(-1/sqrt(n), 1/sqrt(n),size=(100,))
print("min:",-1/sqrt(n),"\tmax:", 1/sqrt(n))
plt.plot(x)
plt.show()

x = torch.empty(100)
torch.nn.init.xavier_uniform_(x)
torch.nn.init.xavier_normal_(x)
torch.nn.init.kaiming_uniform_(x)
# torch.nn.init.kaiming_normal_(selg.weight)
