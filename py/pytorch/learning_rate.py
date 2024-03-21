## https://hackmd.io/@Hong-Jia/H1hmbNr1d
import torch, torch.optim as optim
net = torch.nn.Linear(10,10)
optimizer = optim.SGD(net.parameters(), lr = 1e-5)
scheduler = optim.lr_scheduler.MultiStepLR(optimizer, milestones=[5,10,15], gamma=0.1)

for epoch in range(1, 20 + 1):
    scheduler.step()
    print(epoch, scheduler.get_last_lr()[0])

#%%
import torch
from torch.optim.lr_scheduler import LambdaLR
# Assuming optimizer has two groups.
initial_lr = 1e-3
net = torch.nn.Linear(1,1)
optimizer = torch.optim.Adam(net.parameters(), lr = initial_lr)

def lr_func(epoch):
    print("epoch",epoch)
    if epoch < 5:return 1
    else: return .1
scheduler = LambdaLR(optimizer, lr_lambda=lr_func)

print("初始化的学习率：", optimizer.defaults['lr'])
for epoch in range(1, 11):
    # train
    optimizer.zero_grad()
    optimizer.step()
    print("第%d个epoch的学习率：%f" % (epoch, optimizer.param_groups[0]['lr']))
    scheduler.step()
