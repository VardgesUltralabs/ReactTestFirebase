echo "Build project"
npm run build

echo "Use react-cfb47 id for deployment"
firebase use react-cfb47

echo "Deploy build folder"
firebase deploy --only hosting
