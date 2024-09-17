#!/usr/bin/env bash

while [ $# -gt 0 ]; do
  case "$1" in
    -u|--user)
      USERNAME="$2"
      ;;

    -p|--password)
      PASSWORD="$2"
      ;;

    *)
      echo "Error: Invalid argument" >&2
      exit 1
      ;;
  esac

  shift
  shift
done

# Check if local account already enrolled
if cgetaccount -T system -s "$USERNAME" >> /dev/null; then
  # Account exists in vault
  echo "Warning: Account already exists in vault. Skipping enrolment."
  exit 0
elif [ $? -eq 6 ]; then
  # Account does not exist in vault
  echo -e "$PASSWORD\n$PASSWORD" | passwd "$USERNAME"

  if passwd "$USERNAME"; then 
    # Password updated, enrolling account
    echo "$PASSWORD" | csetaccount --managed=true --stdin "$USERNAME"

    if ! csetaccount --managed=true --stdin "$USERNAME"; then
      # Unable to vault account 
      echo "Error: Unable to vault account '$USERNAME'." >&2
      exit 1
    fi

  else
    # Can't update password
    echo "Error: Unable to update password for account '$USERNAME'." >&2
    exit 1
  fi

else
  # Unhandled exception
  echo "Error: Unexpected error occurred while checking account." >&2
  exit 1
fi
