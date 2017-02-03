﻿using Racing.Moto.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Racing.Moto.Services.Services
{
    public class PostService : BaseServcice
    {
        public void SavePost(Post post)
        {
            if (post.PostId > 0)
            {
                var dbPost = db.Post.Where(p => p.PostId == post.PostId).FirstOrDefault();
                dbPost.Title = post.Title;
                dbPost.PostContent = post.PostContent;
            }
            else
            {
                post.CreateTime = DateTime.Now;
                post.PostStatus = Data.Enums.PostStatus.Pass;

                db.Post.Add(post);
            }

            db.SaveChanges();
        }

        public Post GetPostById(int postId)
        {
            return db.Post.Where(p => p.PostId == postId).FirstOrDefault();
        }
    }
}
