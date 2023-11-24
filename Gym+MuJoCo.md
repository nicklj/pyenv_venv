1. Prerequisite
```
sudo apt-get install patchelf libosmesa6-dev libgl1-mesa-glx libglfw3
```

2. Install Gymnasium/Gym
	- Gym is not in maintenance anymore. All the development has been moved to Gymnasium. But for most of the applications they are equivalent.
	- We'll install Gymnasium. It uses MuJoCo build-in python binding, so no need mujoco-py anymore.
```
pip install matplotlib jupyterlab pandas swig
pip install "cython<3"
pip install opencv-python==4.2.0.32
```

3. Install pytorch
```
pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117
pip install torchvision tensorboard
```

4. Install pybullet (if needed)
```
pip install pybullet
```

5. Install Gymnasium
```
pip install gymnasium[all]
```
If error occurs showing that
*Failed building wheel for box2d-py*
Run
```
pip install wheel setuptools pip --upgrade
```

