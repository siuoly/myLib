import librosa as ra            
import numpy as np
from nnAudio import features
import torch

# memory = Memory(location="feature/mel",verbose=0)
# @memory.cache(ignore=["wav"])
def file2mel(file,wav=None)->np.ndarray:
    if wav is None:
        wav,sr = ra.load(file, sr=None)
        wav = ra.util.fix_length(wav,size=160000)
    mel = ra.feature.melspectrogram(y=wav,sr=16000,n_fft=1024,hop_length=512)
    return mel

# memory2 = Memory(location="feature/gamma",verbose=0)
# @memory2.cache(ignore=["file"])
def file2gamma(file,wav=None)->np.ndarray:
    if wav is None:
        wav,sr = ra.load(file, sr=None)
        wav = ra.util.fix_length(wav,size=160000)
    gamma = features.gammatone.Gammatonegram(
            sr=16000, 
            n_fft=1024, 
            n_bins=128, 
            hop_length=512,
            htk=True,
            power=2.0,
            verbose=False)(torch.from_numpy(wav)).squeeze().numpy()
    return gamma
