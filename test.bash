function exists_in_list() {
    LIST=$1
    DELIMITER=$2
    VALUE=$3
    LIST_WHITESPACES=$(echo "$LIST" | tr "$DELIMITER" " ")
    for x in $LIST_WHITESPACES; do
        if [ "$x" = "$VALUE" ]; then
            return 0
        fi
    done
    return 1
}

#
# Get all PR reviews, filter out only the ones with "APPROVED",
approvedUsers=($(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer xxx" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/mfx-com/testing-packages/pulls/15/reviews | jq -r '.[] | select(.state == "APPROVED") | .user.id'))

for value in "${approvedUsers[@]}"
do
   echo "HELLO: $value"
done

# Get all members from GH Team, return the "id" property as a list
teamUserIDs=($(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer xxx" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/orgs/mfx-com/teams/mfx_staging/members | jq  -r '.[].id'))

#          curl -L \
#            -H "Accept: application/vnd.github+json" \
#            -H "Authorization: Bearer ${{ secrets.BOT_ACCESS_TOKEN }}" \
#            -H "X-GitHub-Api-Version: 2022-11-28" \
#            https://api.github.com/repos/mfx-com/testing-packages/pulls/${{ env.PR_NUMBER }}/reviews
#
#          curl -L \
#            -H "Accept: application/vnd.github+json" \
#            -H "Authorization: Bearer ${{ secrets.BOT_ACCESS_TOKEN }}" \
#            -H "X-GitHub-Api-Version: 2022-11-28" \
#            https://api.github.com/orgs/mfx-com/teams/mfx_staging/members

# !!

#curl -L \
#  -H "Accept: application/vnd.github+json" \
#  -H "Authorization: Bearer xxx" \
#  -H "X-GitHub-Api-Version: 2022-11-28" \
#  https://api.github.com/orgs/mfx-com/teams/mfx_staging/members

COUNTER=0
for value in "${approvedUsers[@]}"
do
     if exists_in_list "$teamUserIDs" " " $value; then
       echo "$value is a valid user from the users list which are allowed to merge"
       COUNTER=$((COUNTER+1))
     else
       echo "$value is NOT in the list of valid users to merge"
     fi
done

name="hello"
team=mfx_staging
if [[ "$name" == "hello" ]] ; then
  team=mfx_prod
fi

echo $team

if [[ $COUNTER -gt 0 ]] ; then
  echo "Allowed to merge."
else
  echo "Not merging."
fi
