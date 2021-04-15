#!/usr/bin/env bash
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $CWD/src/corpusProcessing
./corpusProcess_new.sh sample_dataset 8

cd $CWD/src/featureExtraction
./main.sh sample_dataset -1 ../../KB/data-concept-instance-relations.txt 20

cd $CWD/src/HiExpan-new
python main -data sample_dataset -taxonPrefix $taxonPrefix # default taxonPrefix=toy