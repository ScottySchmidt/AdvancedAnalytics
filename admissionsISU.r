{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "7fe9995c",
   "metadata": {
    "papermill": {
     "duration": 0.004464,
     "end_time": "2022-08-30T15:56:39.533071",
     "exception": false,
     "start_time": "2022-08-30T15:56:39.528607",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Admissions Analysis\n",
    "#### Bus471 Data Analytics\n",
    "Illinois State University; Scott Schmidt\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "87f9568e",
   "metadata": {
    "papermill": {
     "duration": 0.005327,
     "end_time": "2022-08-30T15:56:39.541921",
     "exception": false,
     "start_time": "2022-08-30T15:56:39.536594",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# View Data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "20b36a1d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-08-30T15:56:39.552685Z",
     "iopub.status.busy": "2022-08-30T15:56:39.550492Z",
     "iopub.status.idle": "2022-08-30T15:57:37.967842Z",
     "shell.execute_reply": "2022-08-30T15:57:37.966192Z"
    },
    "papermill": {
     "duration": 58.426183,
     "end_time": "2022-08-30T15:57:37.971393",
     "exception": false,
     "start_time": "2022-08-30T15:56:39.545210",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "also installing the dependencies ‘rJava’, ‘xlsxjars’\n",
      "\n",
      "\n",
      "Loading required package: ggplot2\n",
      "\n",
      "Loading required package: lattice\n",
      "\n",
      "\n",
      "Attaching package: ‘caret’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:httr’:\n",
      "\n",
      "    progress\n",
      "\n",
      "\n",
      "Loaded gbm 2.1.8\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>admit</th><th scope=col>gre</th><th scope=col>gpa</th><th scope=col>rank</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>0</td><td>380</td><td>3.61</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>660</td><td>3.67</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1</td><td>800</td><td>4.00</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1</td><td>640</td><td>3.19</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>0</td><td>520</td><td>2.93</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1</td><td>760</td><td>3.00</td><td>2</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 4\n",
       "\\begin{tabular}{r|llll}\n",
       "  & admit & gre & gpa & rank\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 0 & 380 & 3.61 & 3\\\\\n",
       "\t2 & 1 & 660 & 3.67 & 3\\\\\n",
       "\t3 & 1 & 800 & 4.00 & 1\\\\\n",
       "\t4 & 1 & 640 & 3.19 & 4\\\\\n",
       "\t5 & 0 & 520 & 2.93 & 4\\\\\n",
       "\t6 & 1 & 760 & 3.00 & 2\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 4\n",
       "\n",
       "| <!--/--> | admit &lt;dbl&gt; | gre &lt;dbl&gt; | gpa &lt;dbl&gt; | rank &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 1 | 0 | 380 | 3.61 | 3 |\n",
       "| 2 | 1 | 660 | 3.67 | 3 |\n",
       "| 3 | 1 | 800 | 4.00 | 1 |\n",
       "| 4 | 1 | 640 | 3.19 | 4 |\n",
       "| 5 | 0 | 520 | 2.93 | 4 |\n",
       "| 6 | 1 | 760 | 3.00 | 2 |\n",
       "\n"
      ],
      "text/plain": [
       "  admit gre gpa  rank\n",
       "1 0     380 3.61 3   \n",
       "2 1     660 3.67 3   \n",
       "3 1     800 4.00 1   \n",
       "4 1     640 3.19 4   \n",
       "5 0     520 2.93 4   \n",
       "6 1     760 3.00 2   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "install.packages(\"xlsx\")\n",
    "library(\"xlsx\")\n",
    "library(data.table)\n",
    "library(caret)\n",
    "library(gbm)\n",
    "\n",
    "file='../input/admissions/admissions.xlsx'\n",
    "df= read.xlsx(file, 1, header=TRUE)\n",
    "head(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "48580c5b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-08-30T15:57:38.056240Z",
     "iopub.status.busy": "2022-08-30T15:57:37.986139Z",
     "iopub.status.idle": "2022-08-30T15:57:38.082251Z",
     "shell.execute_reply": "2022-08-30T15:57:38.080276Z"
    },
    "papermill": {
     "duration": 0.106795,
     "end_time": "2022-08-30T15:57:38.085476",
     "exception": false,
     "start_time": "2022-08-30T15:57:37.978681",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "     admit             gre             gpa             rank      \n",
       " Min.   :0.0000   Min.   :220.0   Min.   :2.260   Min.   :1.000  \n",
       " 1st Qu.:0.0000   1st Qu.:520.0   1st Qu.:3.130   1st Qu.:2.000  \n",
       " Median :0.0000   Median :580.0   Median :3.395   Median :2.000  \n",
       " Mean   :0.3175   Mean   :587.7   Mean   :3.390   Mean   :2.485  \n",
       " 3rd Qu.:1.0000   3rd Qu.:660.0   3rd Qu.:3.670   3rd Qu.:3.000  \n",
       " Max.   :1.0000   Max.   :800.0   Max.   :4.000   Max.   :4.000  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(df);"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d370679f",
   "metadata": {
    "papermill": {
     "duration": 0.004463,
     "end_time": "2022-08-30T15:57:38.094070",
     "exception": false,
     "start_time": "2022-08-30T15:57:38.089607",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Treat Missing Values"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "1463229b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-08-30T15:57:38.105362Z",
     "iopub.status.busy": "2022-08-30T15:57:38.103787Z",
     "iopub.status.idle": "2022-08-30T15:57:38.118173Z",
     "shell.execute_reply": "2022-08-30T15:57:38.116472Z"
    },
    "papermill": {
     "duration": 0.023226,
     "end_time": "2022-08-30T15:57:38.121274",
     "exception": false,
     "start_time": "2022-08-30T15:57:38.098048",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "df <- na.omit(df)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ecbb6247",
   "metadata": {
    "papermill": {
     "duration": 0.004334,
     "end_time": "2022-08-30T15:57:38.129693",
     "exception": false,
     "start_time": "2022-08-30T15:57:38.125359",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Acceptance Analysis"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "f9eb63eb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-08-30T15:57:38.140836Z",
     "iopub.status.busy": "2022-08-30T15:57:38.139300Z",
     "iopub.status.idle": "2022-08-30T15:57:38.161804Z",
     "shell.execute_reply": "2022-08-30T15:57:38.159835Z"
    },
    "papermill": {
     "duration": 0.030916,
     "end_time": "2022-08-30T15:57:38.164546",
     "exception": false,
     "start_time": "2022-08-30T15:57:38.133630",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "     rank\n",
       "admit  1  2  3  4\n",
       "    0 28 97 93 55\n",
       "    1 33 54 28 12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "xtabs(~admit + rank, data = df)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b45736b7",
   "metadata": {
    "papermill": {
     "duration": 0.004375,
     "end_time": "2022-08-30T15:57:38.173124",
     "exception": false,
     "start_time": "2022-08-30T15:57:38.168749",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Correlations"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "62d60fbe",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-08-30T15:57:38.184284Z",
     "iopub.status.busy": "2022-08-30T15:57:38.182824Z",
     "iopub.status.idle": "2022-08-30T15:57:38.204975Z",
     "shell.execute_reply": "2022-08-30T15:57:38.202964Z"
    },
    "papermill": {
     "duration": 0.040279,
     "end_time": "2022-08-30T15:57:38.217374",
     "exception": false,
     "start_time": "2022-08-30T15:57:38.177095",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tPearson's product-moment correlation\n",
       "\n",
       "data:  df$admit and df$gre\n",
       "t = 3.7437, df = 398, p-value = 0.0002081\n",
       "alternative hypothesis: true correlation is not equal to 0\n",
       "95 percent confidence interval:\n",
       " 0.08797348 0.27746823\n",
       "sample estimates:\n",
       "      cor \n",
       "0.1844343 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "cor.test(df$admit, df$gre)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "1ab607d0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-08-30T15:57:38.229825Z",
     "iopub.status.busy": "2022-08-30T15:57:38.228328Z",
     "iopub.status.idle": "2022-08-30T15:57:38.246544Z",
     "shell.execute_reply": "2022-08-30T15:57:38.244502Z"
    },
    "papermill": {
     "duration": 0.027377,
     "end_time": "2022-08-30T15:57:38.249044",
     "exception": false,
     "start_time": "2022-08-30T15:57:38.221667",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tPearson's product-moment correlation\n",
       "\n",
       "data:  df$admit and df$gpa\n",
       "t = 3.6132, df = 398, p-value = 0.0003412\n",
       "alternative hypothesis: true correlation is not equal to 0\n",
       "95 percent confidence interval:\n",
       " 0.08158617 0.27151944\n",
       "sample estimates:\n",
       "      cor \n",
       "0.1782123 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "cor.test(df$admit, df$gpa)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "e53eccaa",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-08-30T15:57:38.264875Z",
     "iopub.status.busy": "2022-08-30T15:57:38.263336Z",
     "iopub.status.idle": "2022-08-30T15:57:38.279611Z",
     "shell.execute_reply": "2022-08-30T15:57:38.277996Z"
    },
    "papermill": {
     "duration": 0.026688,
     "end_time": "2022-08-30T15:57:38.282007",
     "exception": false,
     "start_time": "2022-08-30T15:57:38.255319",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tPearson's product-moment correlation\n",
       "\n",
       "data:  df$admit and df$rank\n",
       "t = -4.987, df = 398, p-value = 9.175e-07\n",
       "alternative hypothesis: true correlation is not equal to 0\n",
       "95 percent confidence interval:\n",
       " -0.3326548 -0.1479803\n",
       "sample estimates:\n",
       "       cor \n",
       "-0.2425132 \n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "cor.test(df$admit, df$rank)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9cc5e23f",
   "metadata": {
    "papermill": {
     "duration": 0.006411,
     "end_time": "2022-08-30T15:57:38.295052",
     "exception": false,
     "start_time": "2022-08-30T15:57:38.288641",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Logistic Regression"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "aaedcf6c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-08-30T15:57:38.309211Z",
     "iopub.status.busy": "2022-08-30T15:57:38.307712Z",
     "iopub.status.idle": "2022-08-30T15:57:38.347934Z",
     "shell.execute_reply": "2022-08-30T15:57:38.346324Z"
    },
    "papermill": {
     "duration": 0.049303,
     "end_time": "2022-08-30T15:57:38.350306",
     "exception": false,
     "start_time": "2022-08-30T15:57:38.301003",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       "glm(formula = admit ~ gre + gpa + rank, family = \"binomial\", \n",
       "    data = df)\n",
       "\n",
       "Deviance Residuals: \n",
       "    Min       1Q   Median       3Q      Max  \n",
       "-1.6268  -0.8662  -0.6388   1.1490   2.0790  \n",
       "\n",
       "Coefficients:\n",
       "             Estimate Std. Error z value Pr(>|z|)    \n",
       "(Intercept) -3.989979   1.139951  -3.500 0.000465 ***\n",
       "gre          0.002264   0.001094   2.070 0.038465 *  \n",
       "gpa          0.804038   0.331819   2.423 0.015388 *  \n",
       "rank2       -0.675443   0.316490  -2.134 0.032829 *  \n",
       "rank3       -1.340204   0.345306  -3.881 0.000104 ***\n",
       "rank4       -1.551464   0.417832  -3.713 0.000205 ***\n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "(Dispersion parameter for binomial family taken to be 1)\n",
       "\n",
       "    Null deviance: 499.98  on 399  degrees of freedom\n",
       "Residual deviance: 458.52  on 394  degrees of freedom\n",
       "AIC: 470.52\n",
       "\n",
       "Number of Fisher Scoring iterations: 4\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df$rank <- factor(df$rank)\n",
    "mylogit <- glm(admit ~ gre + gpa + rank, data = df, family = \"binomial\")\n",
    "summary(mylogit)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "19c86f94",
   "metadata": {
    "papermill": {
     "duration": 0.005227,
     "end_time": "2022-08-30T15:57:38.360290",
     "exception": false,
     "start_time": "2022-08-30T15:57:38.355063",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# New Result"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "fcac186b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-08-30T15:57:38.378141Z",
     "iopub.status.busy": "2022-08-30T15:57:38.376459Z",
     "iopub.status.idle": "2022-08-30T15:57:38.397904Z",
     "shell.execute_reply": "2022-08-30T15:57:38.396183Z"
    },
    "papermill": {
     "duration": 0.035338,
     "end_time": "2022-08-30T15:57:38.400209",
     "exception": false,
     "start_time": "2022-08-30T15:57:38.364871",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'New File Created'"
      ],
      "text/latex": [
       "'New File Created'"
      ],
      "text/markdown": [
       "'New File Created'"
      ],
      "text/plain": [
       "[1] \"New File Created\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "newFile=\"results.csv\"\n",
    "fwrite(df, newFile)\n",
    "paste(\"New File Created\")"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 62.779927,
   "end_time": "2022-08-30T15:57:38.525452",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-08-30T15:56:35.745525",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
