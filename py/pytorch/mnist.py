import torch
import torchvision
import torchvision.transforms as transforms
from torch.utils.data import DataLoader
from torchvision.datasets.mnist import MNIST
import torch.nn as nn
import torch.nn.functional as F

trans = transforms.Compose(
    [transforms.ToTensor(), transforms.Normalize((0.5,), (0.5,))]
)
tset = MNIST(root="~/data/", train=True, transform=trans, download=True)
eset = MNIST(root="~/data/", train=False, transform=trans, download=True)
tder = DataLoader(tset, batch_size=64, shuffle=True)
eder = DataLoader(eset, batch_size=64)

iter(tder)._next_data()
tder._get_iterator()._next_data()[0][-1]


class CNN(nn.Module):
    def __init__(self) -> None:
        self.cnn = nn.Conv2d(1, 10, kernel_size=5)
        self.cnn2 = nn.Conv2d(10, 20, kernel_size=5)
        self.drop = nn.Dropout2d()
        self.fc1 = nn.Linear(320, 50)
        self.fc2 = nn.Linear(50, 10)

    def forward(self, x):
        x = F.relu(F.max_pool2d(self.cnn(x), 2))
        x = F.relu(F.max_pool2d(self.drop(self.cnn2(x)), 2))
        x = x.view(-1, 320)
        x = F.relu(self.fc1(x))
        x = self.drop(x, training=self.training)
        x = self.fc2(x)
        return F.log_softmax(x)
