This project is a collaborative undertaking.
# This repo is divided into four parts:
### Code
This directory consists of all the R files and R code used in the exploratory data analysis, development of the preprocessing pipeline, model training, result comparison, and the UI made using Shiny library (R).
### Testing
This directory consists of two text files, each labelled as "TRUE" or "FALSE". The numerical values in each of the file correspond to the input to be entered in the UI to get the corresponding result. For example: on providing numerical values in the file labelled "TRUE" in the UI will result in a "Maintenance Needed" result.
### Dataset
This directory consists of the original dataset, the partially preprocessed dataset (NAN and Outliers handeled), and the fully preprocessed dataset (normalized/standardized).
### python_model_experimentation
This colab files consists of model training experimentations on the fully preprocessed dataset using python libraries, resulting in the **best accuracy on Kaggle** on the Engine Health Dataset using a Random Forest model.
