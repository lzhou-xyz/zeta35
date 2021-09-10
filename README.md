# Zeta35 & Beta10



Codes for the paper  "AT LEAST TWO OF ζ(5), ζ(7), . . . , ζ(35) ARE IRRATIONAL"  Li Lai, Li Zhou.

The paper could be downloaded from arxiv:  https://arxiv.org/abs/2103.00904.



# Zeta35

**main_zeta35.m** is the code for the proof of main **Theorem 1.2** : At least two of ζ(5), ζ(7), ... , ζ(35) are irrational.

 For the purpose of consistency, the names of  variables are the same as those in the paper. 

Take the parameters as follows: 

![](https://latex.codecogs.com/svg.latex?m_1=209,m_2=243,) 

![](https://latex.codecogs.com/svg.latex?\left(\delta_{1},\delta_{2},\ldots,\delta_{36}\right)=(4,4,4,4,4,5,6,7,8,9,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,56,60,64,68),)

It takes almost 1 minute to get the results as follows :

 x0 = 2.894938334463284,

 C1 = 1.677993128952727e+04, 

 C2 = 1.677928264107618e+04.



# Beta10



**main_beta10.m** is the code for the proof of  **Theorem 6.1**:  At least one of β(2), β(4), β(6), β(8), β(10) is irrational. 

For

​			![](https://latex.codecogs.com/svg.latex?\left(\eta_{0},\eta_{1},\ldots,\eta_{11}\right)=(94,32,32,32,32,33,34,35,36,37,38,39),) 

It takes a few seconds to get the results as follows:  

​			![](https://latex.codecogs.com/svg.latex?\lim_{n\rightarrow\infty}\left(\widetilde{\Phi}_{n}^{-1}d_{\widetilde{M}}^{11}\right)^{1/n}=exp(-118.8368175068),) 

​			![](https://latex.codecogs.com/svg.latex?\lim_{n\rightarrow\infty}\widetilde{r}_{n}^{1/n}=exp(118.6245661204).) 

We provide more details in **functionvalue.txt**，this text  records the explicit expression of the step function![](https://latex.codecogs.com/svg.latex?\widetilde{\varphi}_0(x)) on the interval [0,1). 

### More parameters for Beta10:

The parameters we used for last version are

​			![](https://latex.codecogs.com/svg.latex?\left(\eta_{0},\eta_{1},\ldots,\eta_{11}\right)=(347,120,120,121,122,124,127,130,133,136,140,144),) 

 the results are:  

​			 C1 = -905.2339772598   and   C2 = 903.4669134561

one of the referees provided two more simpler parameters:

​    			![](https://latex.codecogs.com/svg.latex?\left(\eta_{0},\eta_{1},\ldots,\eta_{11}\right)=(116,40,40,40,40,41,42,43,44,45,46,47),) 

​			 C1 = -167.1117519102   and   C2 = -167.1117519102,

​    			![](https://latex.codecogs.com/svg.latex?\left(\eta_{0},\eta_{1},\ldots,\eta_{11}\right)=(116,40,40,40,40,41,42,43,44,45,46,48),) 

​			 C1 = -169.4835461763   and   C2 =  168.9817093310.

In this case, we try to find more and get the optimal one (which we think is)  and five more parameters as follows:

​    			![](https://latex.codecogs.com/svg.latex?\left(\eta_{0},\eta_{1},\ldots,\eta_{11}\right)=(111,38,38,38,39,40,41,42,43,44,45,46),) 

​			 C1 = -165.5986604745   and   C2 = 164.3470880379,

​    			![](https://latex.codecogs.com/svg.latex?\left(\eta_{0},\eta_{1},\ldots,\eta_{11}\right)=(118,40,40,40,41,42,43,44,45,46,47,48),) 

​			 C1 =-173.9203291400  and   C2 =  -173.9203291400,

​    			![](https://latex.codecogs.com/svg.latex?\left(\eta_{0},\eta_{1},\ldots,\eta_{11}\right)=(102,35,35,35,35,36,37,38,39,40,41,42),) 

​			 C1 = -137.7413056968   and   C2 = 136.8284928437,

​    			![](https://latex.codecogs.com/svg.latex?\left(\eta_{0},\eta_{1},\ldots,\eta_{11}\right)=(105,36,36,36,36,37,38,39,40,41,42,43),) 

​			 C1 = -143.0851483016   and   C2 =  142.1598888402,

​    			![](https://latex.codecogs.com/svg.latex?\left(\eta_{0},\eta_{1},\ldots,\eta_{11}\right)=(119,41,41,41,42,43,44,45,46,47,48,49),) 

​			 C1 = -184.8701856342   and   C2 =  183.8905111835.









