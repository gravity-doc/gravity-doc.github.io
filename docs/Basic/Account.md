---
sort: 1
title: Account
---

## Apply for an account

```warning
请仔细阅读[用户协议](https://gravity-doc.github.io/Policy.html)，并征求导师同意。   
Please make sure you have read the [user policy](https://gravity-doc.github.io/Policy.html), and get consent of your sponsor/supervisor before application.
```

Use  [**this link**](https://forms.office.com/Pages/ResponsePage.aspx?id=-f5HFYhWBkCG2kSQ-Sc_lW_CRAlVS3tEtz1OEMF6VRNUMUNLOUVOSFhSMTJSTzJSUVozQldJVlRDUy4u) to apply

## Password

You will receive an email once your account is created.
The initial password is included.
You can use `yppasswd` command on *login02* node to update your password.

```warning
- Please change your password immediately the first time you login to your account.
- Never write your password explicitly to others, in emails or chats. The administrators will never ask you for your password and never should you provide them to anybody.
- 请在第一次登陆后立即修改初始密码。
- 请不要在邮件、微信等通信里向任何人提供密码。管理员维护账号也从*不会*需要你的密码。
```

## Forget the password

如果您因为种种原因忘记了密码，请发送邮件至[hpc邮箱](mailto:gravity-hpc@sjtu.edu.cn)，在邮件中注明您要重置密码的账号。如果您不是账号申请人，为了确认您的身份，请务必抄送账号申请人的邮箱。我们会在确保本次重置并非恶意重置之后完成密码重置工作，并发送邮件通知您新的密码。

## Password specification

如果您要自行更改密码，我们建议您遵循如下规则制定新的密码：

1. 不要使用固定的常用密码
2. 不要使用有意义的字符串
3. 密码长度至少8位
4. 密码中至少包含字母和数字

## Account of the SGI

```tip
注意该username为SGI上的原账户，而非gravity账号; 如有新开账户需求请**征得导师同意后**在微信群或者邮件联系管理员。
```

The **SGI** node operates *independently* from the **Gravity cluster**. If you need to use it but do not already have an account, you can contact the administrator after **getting the consent of your supervisor/sponsor**. Then, you can use `ssh username@sgi` on *login02* to access **SGI**

原SGI服务器已经接入login02，可从login02通过`ssh username@sgi`登录。
