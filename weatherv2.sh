#!/bin/bash
#Local Weather Lookup
#Created by notkilometers
#Copyright @ 2020

if [ "$EUID" != 0 ]
then echo "Try again in root"
exit
fi

API="put api key here"

echo Install Dependencies y/n?

read dep

if [ $dep = "y" ]
then apt-get install curl gawk
fi

echo Enter '"'City State'"' to Lookup:

read CS

LINE=$(curl -X GET "http://dataservice.accuweather.com/locations/v1/cities/search?apikey=$API&q=$CS&details=false")

LID=${LINE:21:6}

echo
echo

LINE2=$(curl -X GET "http://dataservice.accuweather.com/forecasts/v1/hourly/1hour/$LID?apikey=$API")

SP=(Epo IconP HasPrecipitation PrecipitationTy PrecipitationInt IsDaylight Temperature Unit PrecipitationProbability MobileLink)
T=()
TH=$(echo  "$LINE2" | awk 'BEGIN { FS = "Epo" } { print $1 }')
TH=$(echo "${TH//'"'}")
TH=$(echo "${TH//'{'}")
TH=$(echo "${TH//'['}")
TH=$(echo "${TH//','}")

T[0]="$TH"
for i in {1..6..1}
do

hv="${SP[i]}"

hva="${SP[i+1]}"

LTR=$(echo "$LINE2" | awk -F"$hv" '{ print $1 }')

NWL=${LINE2//$LTR}
TH=$(echo "$NWL" | awk -F"$hva" '{ print $1 }')
TH=$(echo "${TH//'"'}")
TH=$(echo "${TH//'{'}")
TH=$(echo "${TH//'['}")
TH=$(echo "${TH//','}")

T[i]="$TH"

#T[i]=$(echo  "$LINE2" | awk -F"$hv" '{ print $1 }')

echo "${T[i]}"
done

hv="${SP[8]}"
hva="${SP[9]}"

LTR=$(echo "$LINE2" | awk -F"$hv" '{ print $1 }')
NWL=${LINE2//$LTR}
TH=$(echo "$NWL" | awk -F"$hva" '{ print $1 }')
TH=$(echo "${TH//'"'}")
TH=$(echo "${TH//'{'}")
TH=$(echo "${TH//'['}")
TH=$(echo "${TH//','}")

T[i+1]="$TH"

echo "${T[i+1]}"
