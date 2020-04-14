# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the \"License\");
# you may not use this file except in compliance with the License.\n",
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an \"AS IS\" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Set base Google Cloud Tensorflow base image.
FROM gcr.io/deeplearning-platform-release/tf-gpu.1-14

# Install dependencies.
RUN pip install cloudml-hypertune

# Copy trainer to root.
WORKDIR /home
RUN mkdir -p /home/trainer/
COPY trainer/. /home/trainer/
ENV PYTHONPATH "${PYTHONPATH}:/home/trainer"

# Run training job.
ENTRYPOINT ["python", "trainer/task.py"]