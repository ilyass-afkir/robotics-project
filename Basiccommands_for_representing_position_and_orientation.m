%% Rotation matrices
R = rotx(pi/4);

% The coordinate frame is rotated about the origin according to the orthonormal rotation matrix R
trplot(R);

% Animates a coordinate frame moving from the identity pose to the pose x represented by any of the types listed above.
tranimate(R); 

R = rotx(pi/2) * roty(pi/2);
trplot(R);

%% Euler Angles ZYZ

R = rotz(0.1)*roty(0.2)*rotz(0.3);

% An SO(2) orthonornal rotation matrix (3x3) equivalent to the specified Euler angles. 
% These correspond to rotations about the Z, Y, Z axes respectively
R = eul2r(0.1,0.2,0.3);

% Are the ZYZ Euler angles (1x3) corresponding to the rotational part of  
% an orthonormal rotation matrix R (3x3)
gamma = tr2eul(R);

%% Euler Angles RPY

R = rotz(0.3)*roty(0.2)*rotx(0.1);

%Is an SO(3) orthonornal rotation matrix (3x3) equivalent to the specified roll, pitch, yaw angles angles. 
%These correspond to rotations about the X, Y, Z axes respectively.
R = rpy2r(0.1,0.2,0.3,'zyx');

% Are the roll-pitch-yaw angles (1x3) corresponding to an orthonormal rotation matrix R (3x3)
gamma = tr2rpy(R, 'zyx');

%% Axis Angle
R = angvec2r(pi/2,[1 0 0]);
[theta,v] = tr2angvec(R);

%% Quaternion
help UnitQuaternion
q1 = UnitQuaternion(R);
q1.R;
q2 = q1.inv;
q=q1*q2;
q.R;

%% Homogenous Transformation
T1 = transl(1, 0 ,0);
T2 = trotx(pi/2);
T = T1*T2;
trplot(T);
R=t2r(T);
p=transl(T);

%% SE3
TT1 = SE3(1,0,0);
TT2 = SE3.Rx(pi/2);
TTa = SE3(T);
about(T);
about(TTa);
res = TTa*TTb.inv;
res.isidentity;
help SE3;



