# **Contributing to GoBlazer**

Thank you for considering contributing to **GoBlazer**! We welcome contributions from everyone, whether you're fixing bugs, improving documentation, or adding new features. This document provides guidelines to help you get started.

## **How to Contribute**

### **1. Fork the Repository**

- Start by forking the `goblazer` repository to your GitHub account. You can do this by clicking the "Fork" button at the top right of the repository page.

### **2. Clone Your Fork**

- Clone your fork to your local machine:
  ```bash
  git clone https://github.com/yourusername/goblazer.git
  cd goblazer
  ```

### **3. Create a New Branch**

- Before making any changes, create a new branch for your work:
  ```bash
  git checkout -b feature/your-feature-name
  ```

  - Use a descriptive branch name, such as `feature/add-new-functionality` or `fix/issue-123`.

### **4. Make Your Changes**

- Make your changes in the new branch. Ensure that your code follows the project's coding standards and that it is properly commented.
- If you're adding a new feature, consider adding tests to cover the new functionality.

### **5. Commit Your Changes**

- Commit your changes with a descriptive commit message:
  ```bash
  git add .
  git commit -m "Add feature X to improve Y"
  ```

### **6. Push to Your Fork**

- Push your changes to your forked repository:
  ```bash
  git push origin feature/your-feature-name
  ```

### **7. Submit a Pull Request**

- Go to the original `goblazer` repository on GitHub.
- Click on the "Pull Requests" tab and then click "New Pull Request".
- Select your branch from your fork as the source and the `main` branch of the original repository as the destination.
- Provide a clear and detailed description of your changes in the pull request.

### **8. Review and Collaboration**

- After submitting your pull request, project maintainers will review your code. They may ask for changes before your code is merged into the main branch.
- Please be responsive to feedback and make any requested changes in a timely manner.

## **Code of Conduct**

We expect all contributors to adhere to our [Code of Conduct](CODE_OF_CONDUCT.md). This includes treating everyone with respect, being open to feedback, and fostering a welcoming environment for collaboration.

## **Coding Guidelines**

- Follow [Go's official style guide](https://golang.org/doc/effective_go.html) for Go code.
- Follow [Terraform's style conventions](https://www.terraform.io/docs/language/syntax/style.html) for Terraform configurations.
- Write clear, concise, and well-documented code.
- Include tests for any new features or bug fixes when applicable.
- Ensure your code passes all tests and is lint-free before submitting a pull request.

## **Reporting Issues**

- If you encounter any issues, please submit an issue on GitHub with detailed information about the problem. Include steps to reproduce the issue and any relevant logs or screenshots.
- You can also suggest new features or improvements by submitting an issue.

## **Requesting Features**

- If you have an idea for a new feature, we would love to hear about it! Please open an issue with a detailed description of the feature, its potential use cases, and any implementation ideas.

## **License**

By contributing to **GoBlazer**, you agree that your contributions will be licensed under the [MIT License](LICENSE).

---

### **Conclusion**

This `CONTRIBUTING.md` file provides clear guidelines for contributing to the `goblazer` project, ensuring that all contributors understand the process and expectations. It helps maintain the quality and consistency of the project while encouraging collaboration from the open-source community.
