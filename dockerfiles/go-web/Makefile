
cloudbuild:
	gcloud builds submit

# PROJECT_ID=xxx make build_gcp
build_gcp:
	docker build -t asia.gcr.io/${PROJECT_ID}/go-web:latest .

# PROJECT_ID=xxx make push_gcp
push_gcp:
	docker push asia.gcr.io/${PROJECT_ID}/go-web:latest
