# face-recognition-algorithm-based-on-Histograms-of-Weber-Oriented-Gradient
face recognition

基于HWOG的人脸识别算法。
利用差动激励提取图像的结构和纹理信息，利用HOG算子提取原始图像的边缘特征，分块统计直方图特征信息，将所有分块的直方图串接得到人脸图像HWOG特征，用最近邻分类器进行分类。
差励特征如下：

![](https://github.com/virsing/face-recognition-algorithm-based-on-HWOG/blob/master/test_result/chali.jpg )


以5*5的图像分块，20%的人脸数据训练，其余测试，在yale人脸库测试结果如下：

![](https://github.com/virsing/face-recognition-algorithm-based-on-HWOG/blob/master/test_result/yale.JPG)

以3*3的图像分块，20%的人脸数据训练，其余测试，在orl人脸库的测试结果如下：

![](https://github.com/virsing/face-recognition-algorithm-based-on-HWOG/blob/master/test_result/orl.JPG)
