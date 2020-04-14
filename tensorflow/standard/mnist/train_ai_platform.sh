#!/usr/bin/env bash
# Copyright 2020 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PROJECT_ID=$1
BUCKET_NAME=$2
REGION=$3

DATE=`date '+%Y%m%d_%H%M%S'`
JOB_NAME=mnist_$DATE
GCS_JOB_DIR=gs://$BUCKET_NAME/jobs/$JOB_NAME
TRAIN_FILE=gs://$BUCKET_NAME/data/train-images-idx3-ubyte.gz
TRAIN_LABELS_FILE=gs://$BUCKET_NAME/data/train-labels-idx1-ubyte.gz
TEST_FILE=gs://$BUCKET_NAME/data/t10k-images-idx3-ubyte.gz
TEST_LABELS_FILE=gs://$BUCKET_NAME/data/t10k-labels-idx1-ubyte.gz
IMAGE_URI=gcr.io/$PROJECT_ID/mnist-cpu:latest

gcloud ai-platform jobs submit training $JOB_NAME --stream-logs \
    --job-dir=$GCS_JOB_DIR \
    --config=config.yaml \
    --master-image-uri=$IMAGE_URI \
    --region $REGION -- \
    --train-file=$TRAIN_FILE \
    --train-labels=$TRAIN_LABELS_FILE \
    --test-file=$TEST_FILE \
    --test-labels-file=$TEST_LABELS_FILE