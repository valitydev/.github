LANGUAGE_ARGS=""
if [[ "default" != "default" ]]; then
    LANGUAGE_ARGS="-l java"
fi
echo $LANGUAGE_ARGS
REPOSITORIES=$(gh repo list \
    $OWNER \
    --public \
    --source \
    --no-archived \
    -L 1000 \
    $LANGUAGE_ARGS \
    --json name,owner \
-q '.[] | [.owner.login, .name] | join("/")')
REPOSITORIES="${REPOSITORIES//'%'/'%25'}"
REPOSITORIES="${REPOSITORIES//$'\n'/'%0A'}"
REPOSITORIES="${REPOSITORIES//$'\r'/'%0D'}"
echo "::set-output name=repositories::$REPOSITORIES"
