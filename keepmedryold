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

T1=$(echo "$LINE2" | awk -F, 'BEGIN { FS = "Epo" } ; { print $1 }')

T1=$(echo "${T1//'"'}")
T1=$(echo "${T1//'{'}")
T1=$(echo "${T1//'['}")
T1=$(echo "${T1//','}")

echo "$T1"

LINE2E=$(echo "$LINE2" | awk -F, 'BEGIN { FS = "IconP" } ; { print $1 }')
LINE2=${LINE2//$LINE2E}
T2=$(echo "$LINE2" | awk -F, 'BEGIN { FS = "HasP" } ; { print $1 }')

T2=$(echo "${T2//'"'}")
T2=$(echo "${T2//'{'}")
T2=$(echo "${T2//'['}")
T2=$(echo "${T2//','}")

echo "$T2"

LINE2E=$(echo "$LINE2" | awk -F, 'BEGIN { FS = "HasP" } ; { print $1 }')
LINE2=${LINE2//$LINE2E}
T3=$(echo "$LINE2" | awk -F, 'BEGIN { FS = "PrecipitationTy" } ; { print $1 }')

T3=$(echo "${T3//'"'}")
T3=$(echo "${T3//'{'}")
T3=$(echo "${T3//'['}")
T3=$(echo "${T3//','}")


LINE2E=$(echo "$LINE2" | awk -F, 'BEGIN { FS = "PrecipitationTy" } ; { print $1 }')
LINE2=${LINE2//$LINE2E}
T4=$(echo "$LINE2" | awk -F, 'BEGIN { FS = "PrecipitationInt" } ; { print $1 }')

T4=$(echo "${T4//'"'}")
T4=$(echo "${T4//'{'}")
T4=$(echo "${T4//'['}")
T4=$(echo "${T4//','}")

echo "$T4"

LINE2E=$(echo "$LINE2" | awk -F, 'BEGIN { FS = "PrecipitationInt" } ; { print $1 }')
LINE2=${LINE2//$LINE2E}
T5=$(echo "$LINE2" | awk -F, 'BEGIN { FS = "IsDaylight" } ; { print $1 }')

T5=$(echo "${T5//'"'}")
T5=$(echo "${T5//'{'}")
T5=$(echo "${T5//'['}")
T5=$(echo "${T5//','}")

echo "$T5"

LINE2E=$(echo "$LINE2" | awk -F, 'BEGIN { FS = "IsDaylight" } ; { print $1 }')
LINE2=${LINE2//$LINE2E}
T6=$(echo "$LINE2" | awk -F, 'BEGIN { FS = "Temperature" } ; { print $1 }')

T6=$(echo "${T6//'"'}")
T6=$(echo "${T6//'{'}")
T6=$(echo "${T6//'['}")                                                                                                                                                                                                               T6=$(echo "${T6//','}")
                                                                                                                                                                                                                                      echo "$T6"

LINE2E=$(echo "$LINE2" | awk -F, 'BEGIN { FS = "Temperature" } ; { print $1 }')
LINE2=${LINE2//$LINE2E}
T7=$(echo "$LINE2" | awk -F, 'BEGIN { FS = "Unit" } ; { print $1 }')

T7=$(echo "${T7//'"'}")
T7=$(echo "${T7//'{'}")
T7=$(echo "${T7//'['}")
T7=$(echo "${T7//','}")

echo "$T7"

LINE2E=$(echo "$LINE2" | awk -F, 'BEGIN { FS = "PrecipitationProbability" } ; { print $1 }')
LINE2=${LINE2//$LINE2E}
T8=$(echo "$LINE2" | awk -F, 'BEGIN { FS = "MobileLink" } ; { print $1 }')

T8=$(echo "${T8//'"'}")
T8=$(echo "${T8//'{'}")
T8=$(echo "${T8//'['}")
T8=$(echo "${T8//','}")

echo "$T8"

