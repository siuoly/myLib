import matplotlib.pyplot as plt
from sklearn.datasets import make_gaussian_quantiles, make_blobs
from collections import Counter
from imblearn.over_sampling import SMOTE, BorderlineSMOTE


#######################################################################
mean = [0, 0]
X, y = make_gaussian_quantiles(mean=mean, n_classes=3, n_samples=4000)
# 绘制数据集
plt.figure(figsize=(8, 6))
plt.scatter(X[y == 0][:, 0], X[y == 0][:, 1], label="Class 0", alpha=0.5)
plt.scatter(X[y == 1][:, 0], X[y == 1][:, 1], label="Class 1", alpha=0.5)
plt.scatter(X[y == 2][:, 0], X[y == 2][:, 1], label="Class 1", alpha=0.5)
plt.title("Two-class Gaussian Distribution")
plt.xlabel("Feature 1")
plt.ylabel("Feature 2")
plt.legend()
plt.grid(True)
plt.show()


#######################################################################
X, y = make_blobs(
    n_samples=(500, 100), n_features=2, cluster_std=(1, 0.2), centers=[(0, 0), (4, 4)]
)
# 绘制数据集
plt.figure(figsize=(8, 6))
plt.scatter(X[y == 0][:, 0], X[y == 0][:, 1], label="Class 0", alpha=0.5)
plt.scatter(X[y == 1][:, 0], X[y == 1][:, 1], label="Class 1", alpha=0.5)
plt.title("Two-class Gaussian Distribution")
plt.xlabel("Feature 1")
plt.ylabel("Feature 2")
plt.legend()
plt.grid(True)
plt.show()


#######################################################################
sm = SMOTE(sampling_strategy=0.8, random_state=42, k_neighbors=3)
X_res, y_res = sm.fit_resample(X, y)
Counter(y)
Counter(y_res)
plt.figure(figsize=(8, 6))
plt.scatter(
    X_res[y_res == 0][:, 0], X_res[y_res == 0][:, 1], label="Class 0", alpha=0.5
)
plt.scatter(
    X_res[y_res == 1][:, 0], X_res[y_res == 1][:, 1], label="Class 1", alpha=0.5
)
plt.title("After Smote upsampling Distribution")
plt.xlabel("Feature 1")
plt.ylabel("Feature 2")
plt.legend()
plt.grid(True)
# plt.show()


##%
from sklearn.datasets import make_biclusters

data, rows, columns = make_biclusters(
    shape=(300, 300), n_clusters=5, noise=5, shuffle=False, random_state=0
)

plt.matshow(data, cmap=plt.cm.Blues)
plt.title("Original dataset")
plt.show()

##%
from sklearn.datasets import make_checkerboard

n_clusters = (4, 3)
data, rows, columns = make_checkerboard(
    shape=(300, 300), n_clusters=n_clusters, noise=0, shuffle=False, random_state=42
)

plt.matshow(data, cmap=plt.cm.Blues)
plt.title("Original dataset")
_ = plt.show()


##%
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB

X, y = load_iris(return_X_y=True)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.5, random_state=0)
gnb = GaussianNB()
y_pred = gnb.fit(X_train, y_train).predict(X_test)
print(
    "Number of mislabeled points out of a total %d points : %d"
    % (X_test.shape[0], (y_test != y_pred).sum())
)
plt.scatter(X[:, 0], X[:, 1])
plt.grid()
plt.show()
##%
import numpy as np

X = np.array([[-1, -1], [-2, -1], [-3, -2], [1, 1], [2, 1], [3, 2]])
Y = np.array([1, 1, 1, 2, 2, 2])
plt.scatter(X[:, 0], X[:, 1], c=Y)
##%
from sklearn.naive_bayes import GaussianNB

clf = GaussianNB()
clf.fit(X, Y)
print(clf.predict([[-0.8, -1]]))
clf_pf = GaussianNB()
clf_pf.partial_fit(X, Y, np.unique(Y))
print(clf_pf.predict([[-0.8, -1]]))
