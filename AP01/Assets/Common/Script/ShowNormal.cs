using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShowNormal : MonoBehaviour
{

    public bool drawNormal;
    
    private void OnDrawGizmos()
    {
        if(!drawNormal) return;
        
        var mf = GetComponent<MeshFilter>();
        if (mf == null) return;
        var mesh = mf.sharedMesh;
        if(mesh == null) return;
        var verts = mesh.vertices;
        var normal = mesh.normals;

        Gizmos.color = Color.green;
        Gizmos.matrix = transform.localToWorldMatrix;
        for (var i = 0; i < mesh.vertexCount; i++)
        {
            Gizmos.DrawLine(verts[i], verts[i] + normal[i]*0.05f);
        }
    }

}
