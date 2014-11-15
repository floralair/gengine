<<<<<<< HEAD
gengine Cookbook
================
This cookbook will allow for creation and control of master and slave roles in a grid engine cluster.

Requirements
----------
This requires CentOS with Chef-client pre-installed.

#### packages

Attributes
----------

#### gengine::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['gengine']['nfs-url']</tt></td>
    <td>Boolean</td>
    <td>IP/hostname of external NFS mount</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### gengine::default
Default node prep for users/groups/files for grid engine install.

#### gengine::slave
Mount NFS and wait for gridmaster install.

#### gengine::default
Mount NFS and install grid engine with default cluster parameters.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[gengine]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Andrew Nelson
=======
gengine
=======
>>>>>>> 6b957950c7ad9cdd3b9c9d0d219c42f7496e6081
