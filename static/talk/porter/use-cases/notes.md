* Introduction (2 min)
    * Me - Co-creator of Porter one of the leading CNAB tools
    * Microsoft
    * Want to help you understand what a bundle is, and why you would wan to learn more about them, instead of digging into the details of CNAB or Porter. Let's answer the question of if this would be a useful tool for you, or not.
* What is a bundle? (5 min)
    * Package your application, deployment tools, configuration and deployment logic together as a versioned bundle that you can distribute, and then install with a single command
    * You know how we put applications into a docker container?
    * This puts everything else necessary to deploy into a container for similar gains.

* What problem does it solve? (1 min)
    * Deploying an application. Not the theoretical exercise, in an established environment, or where a helpful sysadmin already did the hard parts. Not just the app itself (docker is lovely isn't it?) but everything it really needs to run.
    * In all of the following examples we are going to be looking not just at the application but what that app really needs to run.
      All of it's dependencies, the underlying infrastructure. And how it gets there. Gets configured. Stays up-to-date.
      The tools that manage that. The logic that knows what needs to happen in what order, the flow of information between the components. The app ends up being an important part, but there's a lot of extra "glue work" that happens to really deploy to prod and keep things running.

* Use Case 1: Bundles package the deployment tools you need (2 min)
    * Create a cluster with a cli, e.g. kubeadm, az, aws, gcloud
    * Create a key value store, e.g. Azure Key Vault, HashiCorp Vault, Google Secret Manager with the provider cli
    * Use helm to install Kubernetes Secrets Store CSI
    * Helpful: 
        * All tools necessary to deploy are included in the bundle.
        * The person deploying did not need to locate the right version of any deployment tools (kubeadm, az/aws/gcloud, kubectl, helm), trust that it was from a reliable source, verify the download, or install it locally, or potentially deal with multiple versions of the same tool on the local machine.
    * Less Helpful:
        * The deployment machine has the tools already installed, or it's only a single stack that deals with multiple versions well. Once you start dealing with multiple tools, multiple machines, and upgrades of tool versions this gets more difficult. But for some it's not a problem.
    * With vs. Without
        * Without:
            * Install each tool
        * With:
            * Install porter and docker

* Use Case 2: Encapsulating the deployment (3 min)
    * Git clone the repository that contains the deployment scripts
    * cd to the right directory in the repo
    * Set proper environment variables with credentials, e.g. GITHUB_TOKEN
    * Download a kubeconfig for the production cluster
    * Read the docs and follow the steps, e.g. run kubeadm first, then provider cli, then helm. Or run this script with these arguments
    * With vs. Without
        * Without:
            * (above)
        * With:
            * `porter install -t myapp:v1.1`
            * Porter helps not just with running the bundle but directing outputs from one tool as inputs into another. This reduces how much glue scripts you have to write.

* Use Case 3: Securely injecting credentials (2 min) [CUT?]
    * Bundles advertise exactly what credentials and parameters they need, so its easier to collect them up-front. You won't realize half-way through that you didn't set a GITHUB_TOKEN and have a deployment fail that needs to be cleaned up.
    * Not all tools support grabbing credentials from a secret store. Bundles give you a way to consistently retrieve and inject credentials, even when using a mix of tools that don't natively support them.
    * Credentials aren't left on the host CI machine or dev environment. If someone runs the deployment one-off, it's still secure without leaving a credential trail.
    * With vs. Without
        * Without:
            * Read docs to identity what creds are needed to deploy
            * Define the credentials in a way that the deployment can access them: env var, files, sometimes vault only
            * Kick deployment and pass in credentials in way that deployment needs them. Specific to each snowflake.
            * Tear down env / cleanup as needed to remove creds if they were put on machine
        * With:
            * `porter explain` to see what credentials (and parameters) the bundle accepts
            * `porter credentials generate` guides you through creating a mapping file. This tells Porter where it can
                find the credentials when the bundle runs. e.g. Github token is in keyvault. Kubeconfig is on the local filesystem.
                This is a one-time step.
            * `porter install -c myapp-creds` (probably don't say) Creds are injected just in time and only exist in the bundle's container which is removed when it completes.

* Use Case 4: Bundles can jump an airgap (2 min)
    * Let's say your production environment airgapped from the internet, or key parts of your CI pipeline. It could be a sensitive
      environment that requires guarantees that it's safe from tampering. Even more fun, you could be deploying to edge devices, 
      research stations, oil rigs or submarines.
    * Bundles can be compressed to a gzip file, including all of its dependencies. Then restored on the
      other side of the airgap where it can be deployed without access to the original artifacts.
    * This is interesting not just from being _able_ to deploy but also having an immutable, reproducible deployment.
    * With vs. Without
        * Without:
            * Artisanal process to identify dependencies and artifacts. Get them onto media and moved across airgap then restored.
        * With:
            * `porter archive myapp.tgz -t staging/myapp:v1.1`
            * put on media and move across airgap
            * `porter publish --archive myapp.tgz --tag production/myapp:v1.1`

* Use Case 5: Crunchy Metadata (2 min)
    * Your organization is interested collecting and analyzing metadata about your deployments
    * Without:
        * Hand rolled solution, or relying on managed deployment as a service and the data it provides
    * With:
        * Bundle metadata: name, version, parameters, credentials, dependencies, outputs, etc.
        * Execution metadata: what's installed, operations performed, duration of operations, parameters specified, the bundle definition at a point in time, etc.
        * Porter uses a declarative bundle syntax that can be inspected for even deeper metadata goodies
            * Mixins used: e.g. terraform, helm, kubectl, bash
            * Commands and arguments used
            * Parameters and Credentials used
        * Can be used to limit what is allowed in bundles, e.g. we don't want to allow bundles that use helm2. We don't want bundles that execute arbitrary bash, etc.

* Anti Use Case 1: Single Stack and Satisfied (1 min)
    * You use a single stack, e.g. everything happens inside of kubernetes and you don't manage your own infrastructure.
    * A deployment involves a single tool and usually a single command to deploy. There's not a lot of glue scripts.
    * With vs. Without
        * Without:
            * `helm install myorg/myapp -f vars.yaml`
        * With:
            * `porter install -t myorg/myapp -p myapp-params`
            * If you are chaining helm calls for example and passing outputs from out as inputs to another, Porter can help with that.
    
* Anti Use Case 2: Windows... For now (1 min)
    * Your deployments have to run on a windows environment and can't execute in a linux container.
    * The CNAB spec has Windows bundles on its roadmap but its not supported yet. Maybe in the next 6 months we will be there.

* Summary: You might be interested in bundles if... (3 min)
    * Using multiple tools together: kubectl + terraform + helm.
    * Crossing Boundaries: k8s + cloud infrastructure outside of the cluster
    * Deployments across airgaps
    * Different people deploy than people who wrote it. The simplicity of distributing via a docker registry and using the same tool and command regardless of stack can be very helpful here.
    * You are interested in having deeper metadata from your artifacts and deployments.

---

* Tooling burden
    * finding and managing proper versions of clients
    * version drift / format changes
    * needing multiple versions on the same deployment boxes
    * trust the client downloaded JIT
* Logic burden
    * finding the repo / scripts / doc to do the deployment
    * knowing what credentials / parameters are supported and required
    * understanding how to use various clients
    * person deploying needs a lot of understanding about what's deployed and how, but may not have written the scripts
    * My logic doesn't fit into yaml, so where does it go so that it's guaranteed to be run?
* Security
    * Not all tools support grabbing credentials from a vault
    * End up with sensitive environment variables and files on jump boxes, ci machines, dev machines
    * Limit scope of credential exposure (to bundle instead of entire machine)
* X
    * Historical record of runs, parameters, and outputs
    * Multiple people deploy / manage environments
* More compelling 
    * Crossing Domain Boundaries, e.g. k8s + cloud infra
    * Involves tools that do not have desired state configuration. e.g. terraform will do a lot for you, gcloud/aws/az cli directly not as much
    * supply chain security
    * different people deploy than people who wrote it
