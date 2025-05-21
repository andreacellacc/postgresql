#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n\nWelcome to My Salon, how can I help you?"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\n1) Cut\n2) Color\n3) Perm\n4) Style\n5) Trim"
  read SERVICE_ID

  if [[ ! $SERVICE_ID =~ ^[1-5]$ ]]
  then 
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID")
    SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME | sed 's/^ *//')
    echo -e "\nWhat's your phone number?"
    read PHONE_NUMBER

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$PHONE_NUMBER'" | sed 's/^ *//')

    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$PHONE_NUMBER', '$CUSTOMER_NAME')")
    fi
  
    echo -e "\nWhat time would you like your $SERVICE_NAME_FORMATTED, $CUSTOMER_NAME?"
    read APPOINTMENT_TIME

    if [[ ! $APPOINTMENT_TIME =~ [0-9]{1,2}:[0-9]{1,2}|[0-9]{1,2}am|[0-9]{1,2}pm ]]
    then
      MAIN_MENU "I could not understand the time of your appointment. What would you like today?"
    else
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")
      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$APPOINTMENT_TIME')")

      if [[ $INSERT_APPOINTMENT_RESULT != "INSERT 0 1" ]]
      then
        MAIN_MENU "That time is already booked. What would you like today?"
      else
        echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $APPOINTMENT_TIME, $CUSTOMER_NAME."
      fi
    fi
  fi
}

MAIN_MENU