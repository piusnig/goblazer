Certainly! Here’s the updated `README.md` for the `goblazer` project, incorporating the information about using shortcuts in the command-line tool:

---

# **GoBlazer**

**GoBlazer** is an open-source command-line tool designed to simplify and automate the management of Terraform configurations and application deployments across multiple environments, including local, development, and production. With a focus on modularity, flexibility, and extensibility, GoBlazer allows users to tailor infrastructure and deployment processes to their specific needs, making it an ideal tool for both individual developers and teams.

## **Features**

- **Modular Terraform Management**: Easily manage infrastructure with reusable Terraform modules.
- **Application Deployment**: Streamline the process of running, deploying, and testing applications.
- **Environment Support**: Seamless management of local, development, and production environments.
- **Customizable Scripts**: Extend functionality with user-defined scripts and plugins.
- **CI/CD Integration**: Integrate seamlessly with CI/CD pipelines using GitHub Actions.
- **Shortcut Commands**: Use concise, intuitive commands for quicker operations.

## **Getting Started**

### **Prerequisites**

#### **For Google Cloud Platform (GCP):**
- [Go](https://golang.org/doc/install) (Version 1.16 or later)
- [Terraform](https://www.terraform.io/downloads.html)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)

#### **For Amazon Web Services (AWS):**
- [Go](https://golang.org/doc/install) (Version 1.16 or later)
- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/) (for AWS deployment)

### **Installation**

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/goblazer.git
   cd goblazer
   ```

2. **Set Up Your Environment Variables**:
   ```bash
   cp .env.local.example .env.local
   ```
   Customize the `.env.local` file with your specific configuration.

3. **Make the `goblazer` Script Executable**:
   ```bash
   chmod +x scripts/goblazer
   ```

4. **Add `scripts/` to Your PATH**:
   ```bash
   export PATH="$PATH:$(pwd)/scripts"
   ```
   Add this line to your `.bashrc`, `.zshrc`, or equivalent configuration file to make the `goblazer` command available from anywhere in your terminal.

### **Usage**

#### **Terraform Commands**

**For Google Cloud Platform (GCP):**

- **Plan**: Preview changes Terraform will make:
  ```bash
  goblazer gcp terraform dev -plan
  ```

- **Apply**: Apply Terraform changes:
  ```bash
  goblazer gcp terraform prod -apply -t google_cloud_run_service.my_service
  ```

**For Amazon Web Services (AWS):**

- **Plan**: Preview changes Terraform will make:
  ```bash
  goblazer aws terraform dev -plan
  ```

- **Apply**: Apply Terraform changes:
  ```bash
  goblazer aws terraform prod -apply -t aws_lambda_function.my_function
  ```

**Shortcut Commands**:

- **Shortcuts for Terraform Commands**:
  ```bash
  goblazer gcp tf dev -plan     # Shortcut for Terraform plan in GCP dev environment
  goblazer aws tf prod -apply   # Shortcut for Terraform apply in AWS prod environment
  ```

#### **Application Commands**

- **Run Application Locally**:
  ```bash
  goblazer app local -run my_app
  ```

- **Deploy Application to Production**:

  **For GCP**:
  ```bash
  goblazer gcp app prod -deploy my_app
  ```

  **For AWS**:
  ```bash
  goblazer aws app prod -deploy my_app
  ```

- **Test Application**:
  ```bash
  goblazer app dev -test
  ```

**Shortcut Commands**:

- **Shortcuts for Application Commands**:
  ```bash
  goblazer gcp -a -d -r my_app run     # Shortcut for running GCP app in dev environment
  goblazer aws -a -p -r my_app deploy  # Shortcut for deploying AWS app in prod environment
  ```

#### **Custom Plugins**

Users can add their own custom scripts in the `plugins/` directory. To run a custom script:

```bash
goblazer plugin my_custom_script.sh local
```

## **CI/CD Pipeline**

GoBlazer integrates with GitHub Actions for continuous integration and deployment. The CI pipeline automatically runs tests and deploys to production on each push to the `main` branch.

### **Setting Up Secrets**

#### **For Google Cloud Platform (GCP):**

Ensure you have the following secrets set in your GitHub repository:

- `GOOGLE_CREDENTIALS`: The content of your service account JSON file.
- `GOOGLE_PROJECT`: Your GCP project ID.
- `GOOGLE_REGION`: Your GCP region.
- `GOOGLE_ZONE`: Your GCP zone.

#### **For Amazon Web Services (AWS):**

Ensure you have the following secrets set in your GitHub repository:

- `AWS_ACCESS_KEY_ID`: Your AWS access key.
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.
- `AWS_DEFAULT_REGION`: Your AWS region.

### **Example GitHub Actions Workflow**

```yaml
name: CI/CD Pipeline

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Go
      uses: actions/setup-go@v2
      with:
        go-version: '^1.16'

    - name: Install dependencies
      run: go mod tidy

    - name: Run tests
      run: go test ./...

    - name: Deploy to GCP
      if: github.ref == 'refs/heads/main' && github.event_name == 'push'
      run: goblazer gcp terraform prod -apply
      env:
        GOOGLE_CREDENTIALS: ${{ secrets.GOOGLE_CREDENTIALS }}
        GOOGLE_PROJECT: ${{ secrets.GOOGLE_PROJECT }}
        GOOGLE_REGION: ${{ secrets.GOOGLE_REGION }}
        GOOGLE_ZONE: ${{ secrets.GOOGLE_ZONE }}

    - name: Deploy to AWS
      if: github.ref == 'refs/heads/main' && github.event_name == 'push'
      run: goblazer aws terraform prod -apply
      env:
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        AWS_DEFAULT_REGION: ${{ secrets.AWS_DEFAULT_REGION }}
```

## **Customization**

### **Custom Terraform Modules**

- Add your custom modules in the `terraform/modules/` directory.
- Reuse and extend existing modules for managing infrastructure.

### **User-Defined Scripts**

- Place your custom scripts in the `scripts/plugins/` directory.
- Modify `goblazer` to include custom scripts as needed.

### **Example Configurations**

Examples for common setups are provided in the `examples/` directory, including:

- **Web Application Deployment**: Basic setup for deploying a web application.
- **Database Setup**: Example configurations for databases like PostgreSQL.
- **CI/CD Pipeline**: Pre-configured CI/CD pipelines.

## **Contributing**

We welcome contributions! Whether you’re fixing bugs, improving documentation, or adding new features, your help is appreciated. Please see the [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines on contributing.

## **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

### **Conclusion**

This `README.md` provides clear, platform-specific instructions for using GoBlazer with both Google Cloud Platform and Amazon Web Services. By including shortcut commands, it emphasizes the ease of use and efficiency of the tool, making it more accessible for users looking to streamline their infrastructure and deployment processes.
