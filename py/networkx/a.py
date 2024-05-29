
# 定義鄰居矩陣A，故意使它不對稱，有向圖比較容易看到訊息傳遞的狀況
import numpy as np

A = np.matrix([
    [0, 1, 0, 0],
    [0, 0, 1, 1], 
    [0, 0, 0, 0],
    [1, 0, 1, 0]],
    dtype=float
)
# 畫圖程式(optional)
import networkx as nx
import matplotlib.pyplot as plt
G=nx.DiGraph(A)
nx.draw(G, with_labels=True)
plt.show()
