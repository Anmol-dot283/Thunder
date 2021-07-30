FROM kalilinux/kali-rolling
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt upgrade -y && apt-get install sudo -y

RUN apt-get install -y\
        git \
        ffmpeg \
        mediainfo \
        unzip \
        wget \
        gifsicle

#Gemt Some Fumks
RUN axel https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && apt install -y ./google-chrome-stable_current_amd64.deb && rm google-chrome-stable_current_amd64.deb
RUN axel https://chromedriver.storage.googleapis.com/88.0.4324.96/chromedriver_linux64.zip && unzip chromedriver_linux64.zip && chmod +x chromedriver && mv -f chromedriver /usr/bin/ && rm chromedriver_linux64.zip
#Import Gudz
RUN wget https://raw.githubusercontent.com/Paramatin-OP/Black-Lightning/master/lightningrun.py
RUN wget https://raw.githubusercontent.com/KeinShin/Black-Lightning/master/requirements.txt
#Start Fumkin
RUN pip3 install -r requirements.txt

CMD ["python3","lightningrun.py"]
